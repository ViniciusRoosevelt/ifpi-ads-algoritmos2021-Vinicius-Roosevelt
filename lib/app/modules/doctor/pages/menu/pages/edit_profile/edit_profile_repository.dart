import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileRepository {
  final firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> fetchUserData(
      String userId) async {
    return firestore
        .collection("usuarios")
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();
  }

  updateData(Map<String, dynamic> json, String uid) {
    firestore.collection('usuarios').doc(uid).update(json);
  }
}
