// Classe para requisitar os dados em JSON via API e convertê-los para Models

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientListRepository {
  var firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserData(
      String userId) async {
    return firestore
        .collection("usuarios")
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPatientList(String userId) {
    var patientData = firestore
        .collection("usuarios/$userId/pacientes")
        .orderBy('nome', descending: true)
        .get();
    return patientData;
  }

  // Stream fetchPatientList(String userId, String searchQuery) {
  //   var patientData = searchQuery == ''
  //       ? firestore
  //           .collection("usuarios/$userId/pacientes")
  //           .orderBy('nome', descending: true)
  //           .where('nome', isGreaterThanOrEqualTo: searchQuery)
  //           .where('nome', isLessThan: searchQuery + 'z')
  //           .snapshots()
  //       : firestore
  //           .collection("usuarios/$userId/pacientes")
  //           .orderBy('nome', descending: true)
  //           .snapshots();
  //   return patientData;
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPatientData(
      String patientId) {
    var patientData = firestore
        .collection("usuarios")
        .where(FieldPath.documentId, isEqualTo: patientId)
        .get();
    return patientData;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchLessonData() {
    var lessons = firestore.collection("licoes").orderBy('nivel').get();
    return lessons;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchActivityData(
      String lessonId) {
    var activities = firestore
        .collection("licoes")
        .doc(lessonId)
        .collection("atividades")
        .get();
    return activities;
  }
}
