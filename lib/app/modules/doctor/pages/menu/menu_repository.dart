// Classe para requisitar os dados em JSON via API e convertê-los para Models

import 'package:cloud_firestore/cloud_firestore.dart';

class MenuRepository {
  var firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserData(
      String userId) async {
    return firestore
        .collection("usuarios")
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchPatientData(
      String patientId) {
    var patientData = firestore
        .collection("usuarios")
        .where(FieldPath.documentId, isEqualTo: patientId)
        .get();
    return patientData;
  }
}
