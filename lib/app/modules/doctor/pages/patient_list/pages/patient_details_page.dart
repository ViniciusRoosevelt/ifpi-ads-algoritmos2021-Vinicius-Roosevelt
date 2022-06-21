import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/notifications/warning_notification.dart';
import '../../../../../core/widgets/patient_grade.dart';

import '../../../../../core/widgets/simple_loader_widget.dart';
import '../../../core/models/patient.dart';
import '../../../doctor_controller.dart';
import '../patient_list_controller.dart';
import '../widgets/activity_expansion_tile.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({Key? key}) : super(key: key);

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState
    extends ModularState<PatientDetailsPage, PatientListController> {
  var doctorController = Modular.get<DoctorController>();
  @override
  void initState() {
    super.initState();
    controller.getLessonData();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments.runtimeType == Patient) {
      doctorController.patientDataBackup =
          ModalRoute.of(context)?.settings.arguments as Patient;
    }

    var patient = doctorController.patientDataBackup;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return RxBuilder(builder: (context) {
      if (controller.lessonRequestState.value == RequestState.SUCCESS) {
        controller.formatActivityAttempts(patient);
        return CustomScaffold(
          title: 'Lições de ${patient.nome?.split(' ')[0]}',
          body: SingleChildScrollView(
            child: Column(
              children: [
                _patientData(patient, height, width),
                SizedBox(height: height * .02),
                RxBuilder(builder: (context) {
                  return AppFlatButton(
                    onPressed: patient.tentativasAtividades.isNotEmpty
                        ? () => Navigator.of(context).pushNamed(
                              '/doctor/patient-list/audio-list',
                              arguments: patient,
                            )
                        : null,
                    text: 'Lista de áudios',
                  );
                }),
                SizedBox(height: height * .02),
                FutureBuilder<QuerySnapshot>(
                    future: controller.lessonData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!.docs
                              .map((lesson) {
                                var lessonData =
                                    lesson.data() as Map<String, dynamic>;
                                return ActivityExpansionTile(
                                    backgroundColor: _getBackgroundColor(
                                            int.parse(lessonData['nivel']))
                                        .withOpacity(.16),
                                    iconColor: _getBackgroundColor(
                                        int.parse(lessonData['nivel'])),
                                    title: Text(
                                      'Nível ${lessonData['nivel']} - ${lessonData['titulo']}',
                                      style: AppTypography.h2.copyWith(
                                        color: _getBackgroundColor(
                                            int.parse(lessonData['nivel'])),
                                      ),
                                    ),
                                    subtitle: Text('${lessonData['corpo']}'),
                                    trailing:
                                        Icon(Icons.arrow_drop_down_outlined),
                                    children: [
                                      FutureBuilder<QuerySnapshot>(
                                          future: controller
                                              .getActivityData(lesson.id),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Column(
                                                  children: snapshot.data!.docs
                                                      .map((activity) {
                                                        var activityTemp =
                                                            activity.data()
                                                                as Map<String,
                                                                    dynamic>;
                                                        var activityAttempts = controller
                                                            .getAttemptsOfActivity(
                                                                patient,
                                                                lesson.id,
                                                                activity.id,
                                                                activityTemp[
                                                                        'titulo'] ??
                                                                    '');

                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: InkWell(
                                                            onTap: () => int.parse(activityAttempts[0]) > 0
                                                                ? Navigator.of(context).pushNamed(
                                                                    '/doctor/patient-list/activity-report',
                                                                    arguments: (activityAttempts[
                                                                            2]
                                                                        as List<
                                                                            Map<String,
                                                                                dynamic>>))
                                                                : WarningNotification().call(
                                                                    title:
                                                                        'Atenção!',
                                                                    subtitle:
                                                                        'O paciente ainda não fez essa atividade.'),
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              height: 120.0,
                                                              decoration:
                                                                  _activityCardStyle(
                                                                      int.parse(
                                                                          activityAttempts[
                                                                              0])),
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  _activityTitle(
                                                                      (activity.data() as Map<
                                                                          String,
                                                                          dynamic>),
                                                                      width),
                                                                  Spacer(),
                                                                  _activityResult(
                                                                      activityAttempts,
                                                                      width),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      })
                                                      .toSet()
                                                      .toList());
                                            } else {
                                              return Center(
                                                child: SimpleLoaderWidget(
                                                  key: Key('patientListLoader'),
                                                ),
                                              );
                                            }
                                          }),
                                    ]);
                              })
                              .toSet()
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: SimpleLoaderWidget(
                            key: Key('patientListLoader'),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
          height: height,
          width: width,
        );
      } else if (controller.lessonRequestState.value == RequestState.LOADING) {
        return SimpleLoaderWidget(
          key: Key('lessonLoader'),
        );
      } else {
        return Container();
      }
    });
  }

  _patientData(Patient patient, double height, double width) => Container(
        child: Column(
          children: <Widget>[
            _patientPhoto(patient, height, width),
            _patientField('', patient.nome ?? ''),
            _patientField('Nível', patient.nivel.value),
            _patientField('Nasceu em', patient.dataNascimento ?? ''),
            _patientField('Início do Tratamento', patient.dataDeInicio ?? ''),
          ],
        ),
      );

  _patientPhoto(Patient patient, double height, double width) => Container(
      padding: EdgeInsets.only(bottom: height * .02),
      height: height * .15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
      ),
      child: Image.network(patient.fotoPerfil ??
          'https://cdn-icons-png.flaticon.com/512/1250/1250689.png?w=996'));

  _patientField(String fieldName, String field) => Text(
        fieldName != '' ? '$fieldName: $field' : field,
        style: fieldName != '' ? AppTypography.h2 : AppTypography.hx,
        textAlign: TextAlign.center,
      );

  _getBackgroundColor(int index) {
    switch (index % 5) {
      case 1:
        return AppColors.primary;
      case 2:
        return AppColors.secondary;
      case 3:
        return AppColors.terciary;
      case 4:
        return AppColors.quarternary;
      case 5:
        return AppColors.dangerDark;
    }
  }

  _activityCardStyle(int attempts) => BoxDecoration(
          color: attempts > 0 ? Colors.white : Colors.white60,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: attempts > 0 ? AppColors.black_16 : Colors.transparent,
              blurRadius: 4.0,
            ),
          ]);

  _activityTitle(Map<String, dynamic> activity, double width) {
    return Container(
      width: width * .35,
      child: Text(
        activity['titulo'] ?? 'Não identificado',
        style: AppTypography.h1,
        textAlign: TextAlign.center,
      ),
    );
  }

  _activityResult(List<dynamic> activityAttemptsAndMaxGrade, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PatientGrade(
          screenWidth: width,
          value: double.parse(activityAttemptsAndMaxGrade[1]),
        ),
        Text(
          'Nota Máxima: ${double.parse(activityAttemptsAndMaxGrade[1]).toStringAsFixed(2)}',
          style: AppTypography.bodyEmphasis,
        ),
        Text(
          'Tentativas: ${activityAttemptsAndMaxGrade[0]}',
          style: AppTypography.bodyEmphasis,
        ),
      ],
    );
  }
}
