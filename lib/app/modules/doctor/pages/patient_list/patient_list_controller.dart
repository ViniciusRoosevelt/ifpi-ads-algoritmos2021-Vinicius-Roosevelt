import 'dart:async';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../core/enums/request_state.dart';
import '../../core/models/doctor.dart';
import '../../core/models/lesson.dart';
import '../../core/models/patient.dart';
import '../../../../core/models/user_activity.dart';
import 'patient_list_repository.dart';

class PatientListController {
  final PatientListRepository
      repository; // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)

  var requestState = RxNotifier<RequestState>(RequestState.IDLE);
  var lessonRequestState = RxNotifier<RequestState>(RequestState.IDLE);

  late Future<QuerySnapshot<Map<String, dynamic>>> userData;
  late Future<QuerySnapshot<Map<String, dynamic>>> patientData;
  late Stream<dynamic> patientTest;
  late Future<QuerySnapshot<Map<String, dynamic>>> lessonData;
  late Future<QuerySnapshot<Map<String, dynamic>>> activityData;
  late int amountOfPatients;
  late RxNotifier<int> quantidadeDeAtividades = RxNotifier<int>(1);
  Future<List<dynamic>>? patientList;
  Future<List<dynamic>>? lessonList;
  Future<List<dynamic>>? activityList;

  final _patientDataBackup = RxNotifier<Patient>(Patient());

  Patient get patientDataBackup => _patientDataBackup.value;
  set patientDataBackup(Patient patient) => _patientDataBackup.value = patient;

  final _doctor = RxNotifier<Doctor>(Doctor());

  Doctor get doctor => _doctor.value;
  set doctor(Doctor doctor) => _doctor.value = doctor;

  // final _patient = RxNotifier<Patient>(Patient());

  // Patient get patient => _patient.value;
  // set patient(Patient patient) => _patient.value = patient;

  final _doctorUserId = RxNotifier<String>('');

  String get doctorUserId => _doctorUserId.value;
  set doctorUserId(String doctor) {
    _doctorUserId.value = doctor;
  }

  RxNotifier<String> _patientSearchString = RxNotifier<String>('');

  String get patientSearchString => _patientSearchString.value;
  set patientSearchString(String search) => _patientSearchString.value = search;

  var searchedPatients = RxList<Map<String, dynamic>>();

  PatientListController({required this.repository});

  void getProfileData() async {
    requestState.value = RequestState.LOADING;
    userData = repository.fetchUserData(doctorUserId);
    userData.then((value) {
      doctor = Doctor.fromJson(value.docs.first.data())..id = doctorUserId;
      // getPatientList(value.docs.first.data()['pacientes']);
      getPatientList(doctorUserId);
    });
  }

  void getPatientList(String userId) {
    var listTemp = [];
    repository.fetchPatientList(userId).then((patientReferenceList) {
      patientReferenceList.docs.forEach((element) {
        patientData = repository
            .fetchPatientData(element.data()['perfil'].path.split('/')[1]);
        listTemp.add(patientData);
        amountOfPatients = listTemp.length;
        patientList = Future<List<dynamic>>.value(listTemp);
      });
      requestState.value = RequestState.SUCCESS;
    });
  }

  // void getPatientList(List<dynamic> patientReferenceList) {
  //   var listTemp = [];

  //   patientReferenceList.forEach((element) {
  //     patientData = repository.fetchPatientData(element.id);
  //     listTemp.add(patientData);
  //   });
  //   amountOfPatients = listTemp.length;
  //   patientList = Future<List<dynamic>>.value(listTemp);
  //   requestState.value = RequestState.SUCCESS;
  // }

  void getLessonData() async {
    lessonRequestState.value = RequestState.LOADING;
    lessonData = repository.fetchLessonData();
    lessonData.then((value) {
      value.docs.forEach((i) {
        getActivityData(i.id);
      });
    });
  }

  getActivityData(String lessonId) {
    var listTemp = [];
    activityData = repository.fetchActivityData(lessonId);
    activityData.then((value) {
      value.docs.forEach((i) {
        var activityTemp = i.data();
        activityTemp["id"] = i.id;
        listTemp.add(activityTemp);
      });
    });
    listTemp.forEach((element) {
      print(element);
    });
    quantidadeDeAtividades.value = listTemp.length;
    activityList = Future<List<dynamic>>.value(listTemp);
    lessonRequestState.value = RequestState.SUCCESS;
    return activityData;
  }

  // void getSearchedPatients() {
  //   searchedPatients.clear();
  //   searchedPatients.addAll(list!
  //       .where((element) =>
  //           changeSpecialCharacters(element["nome"]!.toLowerCase())
  //               .contains(patientSearchString.toLowerCase()))
  //       .toList());
  // }

  void formatActivityAttempts(Patient patient) {
    patient.tentativasAtividades.forEach((attempt) {
      attempt['codigoAtividade'] = attempt['atividade'].path;
      attempt['codigoAtividade'] = attempt['codigoAtividade'].split('/')[1] +
          attempt['codigoAtividade'].split('/')[3];
      attempt['dataFormatada'] = UtilData.obterDataDDMMAAAA(
          DateTime.parse((attempt['data'] ?? '').toDate().toString()));
    });
  }

  List<dynamic> getAttemptsOfActivity(Patient patient, String lessonId,
      String activityId, String activityTitle) {
    int attemptCount = 0;
    int id = 0;
    double maxGrade = 0.0;
    List<Map<String, dynamic>> activityAttempts = [];
    patient.tentativasAtividades.forEach((attempt) {
      if (attempt['codigoAtividade'] == (lessonId + activityId)) {
        attemptCount++;
        if (double.parse(attempt['nota']) > maxGrade) {
          maxGrade = double.parse(attempt['nota']);
        }
        attempt['id'] = id.toString();
        attempt['tituloAtividade'] = activityTitle;
        id++;
        activityAttempts.add(attempt);
      }
    });

    return [attemptCount.toString(), maxGrade.toString(), activityAttempts];
  }

  String changeSpecialCharacters(String str) {
    {
      str = str.replaceAll(RegExp('[ÀÁÂÃÄÅ]'), "A");
      str = str.replaceAll(RegExp('[àáâãäå]'), "a");
      str = str.replaceAll(RegExp('[ÈÉÊË]'), "E");
      str = str.replaceAll(RegExp('[éêëè]'), "e");
      str = str.replaceAll(RegExp('[ÍÌÎÏ]'), "I");
      str = str.replaceAll(RegExp('[íìîï]'), "i");
      str = str.replaceAll(RegExp('[ÓÒÔÕÖ]'), "O");
      str = str.replaceAll(RegExp('[òõôóö]'), "o");
      str = str.replaceAll(RegExp('[ÙÚÛÜ]'), "U");
      str = str.replaceAll(RegExp('[ùúûü]'), "u");
      str = str.replaceAll('Ç', "C");
      str = str.replaceAll('ç', "c");

      return str.replaceAll(RegExp('[^a-z0-9]/gi'), '');
    }
  }
}
