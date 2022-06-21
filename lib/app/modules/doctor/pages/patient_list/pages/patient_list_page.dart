import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../core/models/patient.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';

import '../../../doctor_controller.dart';
import '../../patient_list/patient_list_controller.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/no_patient_text.dart';
import '../widgets/patient_list_title.dart';
import '../widgets/patient_tile.dart';

class PatientListPage extends StatefulWidget {
  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState
    extends ModularState<PatientListPage, PatientListController> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RxBuilder(builder: (context) {
      if (controller.requestState.value == RequestState.LOADING) {
        return SimpleLoaderWidget(key: Key('pageLoader'));
      } else {
        return FutureBuilder<QuerySnapshot>(
            future: controller.userData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        doctor: controller.doctor,
                      ),
                      // _searchInput(controller, height, width),
                      const PatientListTitle(),
                      _patientList(controller, height, width),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: SimpleLoaderWidget(
                    key: Key('patientListLoader'),
                  ),
                );
              }
            });
      }
    });
  }

  _searchInput(PatientListController controller, double width, double height) =>
      Container(
        padding: EdgeInsets.fromLTRB(
            width * .02, height * .04, width * .02, height * .05),
        child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primary,
                ),
                hintText: 'Digite sua busca aqui'),
            onChanged: (search) {
              controller.patientSearchString =
                  controller.changeSpecialCharacters(search);
              controller.getPatientList(controller.doctorUserId);
            }),
      );

  _patientList(PatientListController controller, double height, double width) {
    return Container(
        height: height * .49,
        padding: EdgeInsets.symmetric(horizontal: width * .03),
        child: FutureBuilder<List<dynamic>>(
            future: controller.patientList,
            builder: (context, listSnapshot) {
              return ListView.builder(
                  itemCount: controller.amountOfPatients,
                  itemBuilder: (context, index) {
                    return FutureBuilder<QuerySnapshot>(
                        future: listSnapshot.data?[index],
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              (snapshot.data?.docs.length ?? 0) > 0) {
                            final patientId = snapshot.data?.docs.first.id;
                            final patient = snapshot.data?.docs.first.data()
                                as Map<String, dynamic>;
                            patient["id"] = patientId;
                            controller.doctor.pacientes
                                .add(Patient.fromJson(patient));
                            return PatientTile(
                                patient: Patient.fromJson(patient));
                          } else if (snapshot.hasData &&
                              (snapshot.data?.docs.length ?? 0) == 0) {
                            return NoPatientText();
                          } else {
                            return SimpleLoaderWidget(
                                key: Key('patientLoader'));
                          }
                        });
                  });
            }));
  }
}
