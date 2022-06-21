import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:rx_notifier/rx_notifier.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/models/doctor.dart';
import 'menu_repository.dart';

class MenuController {
  final MenuRepository
      repository; // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)

  MenuController({required this.repository});

  var requestState = RxNotifier<RequestState>(RequestState.IDLE);

  late Future<QuerySnapshot<Map<String, dynamic>>> userData;
  late Future<QuerySnapshot<Map<String, dynamic>>> doctorData;
  late Future<QuerySnapshot<Map<String, dynamic>>> patientData;
  late Future<QuerySnapshot<Map<String, dynamic>>> patientUserData;
  Future<List<dynamic>>? patientList;
  Future<List<dynamic>>? patientUserList;

  final _doctor = RxNotifier<Doctor>(Doctor());

  Doctor get doctor => _doctor.value;
  set doctor(Doctor doctor) => _doctor.value = doctor;

  final _doctorUserId = RxNotifier<String>('');

  String get doctorUserId => _doctorUserId.value;
  set doctorUserId(String doctor) {
    _doctorUserId.value = doctor;
  }

  void getProfileData() async {
    requestState.value = RequestState.LOADING;
    userData = repository.fetchUserData(doctorUserId);
    userData.then((value) {
      doctor = Doctor.fromJson(value.docs.first.data());
      doctor.id = doctorUserId;
      requestState.value = RequestState.SUCCESS;
    });
  }
}
