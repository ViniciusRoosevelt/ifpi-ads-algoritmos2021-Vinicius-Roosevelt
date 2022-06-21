// Classe para requisitar os dados em JSON via API e convertê-los para Models

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_notifier/rx_notifier.dart';

class DoctorRepository {
  // var firestore = FirebaseFirestore.instance;

  // Future<QuerySnapshot<Map<String, dynamic>>> fetchUserData(
  //     String userId) async {
  //   return firestore
  //       .collection("usuarios")
  //       .where(FieldPath.documentId, isEqualTo: userId)
  //       .get();
  // }

  // Future<QuerySnapshot<Map<String, dynamic>>> fetchPatientData(
  //     String patientId) {
  //   var patientData = firestore
  //       .collection("usuarios")
  //       .where(FieldPath.documentId, isEqualTo: patientId)
  //       .get();
  //   return patientData;
  // }

  // Future<QuerySnapshot<Map<String, dynamic>>> fetchPatientUserData(
  //     String patientUserId) {
  //   var patientUserData = firestore
  //       .collection("usuarios")
  //       .where(FieldPath.documentId, isEqualTo: patientUserId.split('/')[1])
  //       .get();
  //   return patientUserData;
  // }

  // Map<String, dynamic> fetchDoctorProfileData(Map<String, dynamic> userData) {
  //   doctorData['descricao'] = '';
  //   doctorData['pacientes'] = [];
  //   var patientData = Map<String, dynamic>();
  //   var firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection("fonoaudiologos")
  //       .where(FieldPath.documentId,
  //           isEqualTo: doctorData['dadosConta'].split('/')[1].toString())
  //       .get()
  //       .then((value) {
  //     doctorData["descricao"] = value.docs.single.data()["descricao"];
  //     print(value.docs.single.data()["pacientes"]);
  //     value.docs.single.data()["pacientes"].forEach((patient) {
  //       patientData = {};
  //       firestore
  //           .collection("pacientes")
  //           .where(FieldPath.documentId, isEqualTo: patient)
  //           .get()
  //           .then((value) {
  //         patientData = value.docs.first.data();
  //         firestore
  //             .collection('usuarios')
  //             .where(FieldPath.documentId,
  //                 isEqualTo: value.docs.first.data()['dadosUsuario'])
  //             .get()
  //             .then((patientUser) {
  //           patientUser.docs.first.data().forEach((key, value) {
  //             patientData[key] = value;
  //           });
  //         });
  //         doctorData['pacientes'].add(patientData);
  //         return doctorData;
  //         // value.docs.first
  //         //     .data()['tentativasAtividades']
  //         //     .forEach((attempt) => print(attempt));
  //         // print(doctorData);
  //       });
  //     });
  //   });
  //   return doctorData;
  // }
}
