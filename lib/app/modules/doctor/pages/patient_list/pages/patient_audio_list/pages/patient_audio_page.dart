import 'dart:async';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/enums/request_state.dart';
import '../../../../../../../core/services/local_data/local_data.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../core/widgets/simple_loader_widget.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/models/patient.dart';
import '../../../../../doctor_controller.dart';
import '../patient_audio_controller.dart';
import '../widgets/player_alert.dart';

class PatientAudioPage extends StatefulWidget {
  @override
  _PatientAudioPageState createState() => _PatientAudioPageState();
}

class _PatientAudioPageState
    extends ModularState<PatientAudioPage, PatientAudioController> {
  var doctorController = Modular.get<DoctorController>();

  @override
  void initState() {
    super.initState();
    controller.getPatientRequestData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Patient patient = Modular.args.data as Patient;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return RxBuilder(builder: (context) {
      if (controller.requestState.value == RequestState.LOADING) {
        return SimpleLoaderWidget(key: Key('pageLoader'));
      } else {
        return CustomScaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Text(
                  'Estes são os áudios de ${patient.nome?.split(' ')[0]}:',
                  style: AppTypography.h1.copyWith(color: AppColors.primary),
                ),
                StreamBuilder<RxList<String>>(
                    stream: controller.patientRequestData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return RxBuilder(builder: (context) {
                          if (snapshot.data!.isEmpty) {
                            return Container(
                              height: height * .3,
                              child: Center(
                                child: Text(
                                  'Não há áudios para esse paciente!',
                                  style: AppTypography.h2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: patient.tentativasAtividades.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(patient.tentativasAtividades[index]);
                                    showDialog(
                                        context: context,
                                        builder: (context) => PlayerAlert(
                                              audioUrl:
                                                  patient.tentativasAtividades[
                                                      index]['audio'],
                                            ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(width * .01),
                                    child: Container(
                                      padding: EdgeInsets.all(16.0),
                                      height: 120.0,
                                      decoration: _requestCardStyle(),
                                      child: Row(
                                        children: <Widget>[
                                          _playLeading(
                                              patient
                                                  .tentativasAtividades[index]
                                                      ['audio']
                                                  .toString()
                                                  .substring(78, 102),
                                              width),
                                          Spacer(),
                                          _playTrailing(
                                              width,
                                              patient.tentativasAtividades[
                                                  index]['audio'],
                                              controller),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        });
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
          title: 'Lista de áudios',
        );
      }
    });
  }
}

_requestCardStyle() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black_16,
            blurRadius: 4.0,
          ),
        ]);

_playLeading(String name, double width) {
  List<String> splittedName = name.split('_');
  String newName = splittedName[0][0].toUpperCase() +
      splittedName[0].substring(1) +
      ' ' +
      splittedName[1].toUpperCase();
  String date =
      UtilData.obterDataDDMMAAAA(DateTime.parse((splittedName[3]).toString()));

  return Container(
    width: width * .35,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          newName,
          style: AppTypography.h1,
          textAlign: TextAlign.center,
        ),
        Text(
          date,
          style: AppTypography.h1,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

_playTrailing(
    double width, String audioPath, PatientAudioController controller) {
  return RxBuilder(builder: (context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => PlayerAlert(
                  audioUrl: audioPath,
                ));
        // async {
        // controller.play(audioPath);
      },
      child: Icon(
        controller.isPlaying.value ? Icons.stop : Icons.play_arrow_rounded,
        color: Colors.white,
      ),
    );
  });
}
