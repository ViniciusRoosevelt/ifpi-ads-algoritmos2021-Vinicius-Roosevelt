import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/services/local_data/local_data.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../core/widgets/notifications/error_notification.dart';
import '../../../../../core/widgets/notifications/success_notification.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';
import '../../../doctor_controller.dart';
import '../add_patient_controller.dart';
import '../widgets/reject_alert.dart';

class AddPatientPage extends StatefulWidget {
  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState
    extends ModularState<AddPatientPage, AddPatientController> {
  var doctorController = Modular.get<DoctorController>();

  @override
  void initState() {
    super.initState();
    if (Modular.args.data.runtimeType == String) {
      doctorController.doctorUserIdBackup = Modular.args.data as String;
    }
    controller.doctorUserId = doctorController.doctorUserIdBackup;
    controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return RxBuilder(builder: (context) {
      if (controller.requestState.value == RequestState.LOADING) {
        return SimpleLoaderWidget(key: Key('pageLoader'));
      } else {
        return Scaffold(
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
                  '${controller.doctor.nome?.split(' ')[0]}, os seguintes pacientes desejam ser acompanhados por você:',
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
                                  'Não há novas solicitações no momento!',
                                  style: AppTypography.h2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(width * .01),
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    height: 120.0,
                                    decoration: _requestCardStyle(),
                                    child: Row(
                                      children: <Widget>[
                                        _requestTitle(
                                            snapshot.data?[index] ?? '', width),
                                        Spacer(),
                                        _requestOptions(
                                            width,
                                            snapshot.data!,
                                            snapshot.data?[index] ?? '',
                                            context),
                                      ],
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

_requestTitle(String name, double width) {
  return Container(
    width: width * .35,
    child: Text(
      name,
      style: AppTypography.h1,
      textAlign: TextAlign.center,
    ),
  );
}

_requestOptions(
    double width, RxList<String> data, String name, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text('Aceitar?'),
      Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                mini: true,
                backgroundColor: AppColors.success,
                onPressed: () {
                  data.removeWhere((item) => item == name);
                  SuccessNotification().call(
                      title: 'Aceito',
                      subtitle: 'Você aceitou acompanhar $name!');
                },
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
              FloatingActionButton(
                mini: true,
                onPressed: () async {
                  var reject = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RejectAlert();
                      });
                  if (reject) {
                    data.removeWhere((item) => item == name);
                    ErrorNotification().call(
                        title: 'Recusado',
                        subtitle: 'Você recusou acompanhar $name!');
                  }
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: StadiumBorder(
                    side: BorderSide(color: AppColors.danger, width: 2)),
                child: Icon(Icons.clear, color: AppColors.danger),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
