import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  signUp(Map<String, dynamic> json, String password) {
    auth
        .createUserWithEmailAndPassword(
            email: json['email'], password: password)
        .then((user) {
      print(user.user?.uid);
      associateUserWithProfile(json, user.user?.uid ?? '');
    });
  }

  bool associateUserWithProfile(Map<String, dynamic> userData, String uid) {
    if (userData['isFono']) {
      firestore.collection('usuarios').doc(uid).set(userData);
      firestore.collection('usuarios/$uid/pacientes').doc('0').set(
          {'nome': '', 'perfil': firestore.collection('usuarios').doc('0')});
    } else {
      firestore.collection('usuarios').doc(uid).set(userData);
    }
    return true;
  }
}
