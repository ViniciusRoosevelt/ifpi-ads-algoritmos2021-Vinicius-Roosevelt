import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../core/models/access_data.dart';
import '../../core/models/doctor.dart';
import '../../core/services/local_data/local_data.dart';
import '../../core/styles/colors.dart';
import '../../core/widgets/notifications/error_notification.dart';
import 'auth_repository.dart';

class AuthController implements Disposable {
  final AuthRepository
      repository; // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)

  AuthController({required this.repository});

  final _enableButton = RxNotifier<bool>(false);

  bool get enableButton => _enableButton.value;
  set enableButton(bool value) => _enableButton.value = value;

  final _email = RxNotifier<String>('');

  String get email => _email.value;
  set email(String value) => _email.value = value;

  bool emailIsValid() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  final _password = RxNotifier<String>('');

  String get password => _password.value;
  set password(String value) => _password.value = value;

  bool passwordIsValid() => password.length >= 6;

  final _userId = RxNotifier<String>('');

  String get userId => _userId.value;
  set userId(String value) => _userId.value = value;

  void enableLogin() {
    if (emailIsValid() && passwordIsValid()) {
      enableButton = true;
    } else {
      enableButton = false;
    }
  }

  Future<void> loginWithLocalStorage() async {
    AccessData accessData = await LocalData.readAccessData();
    if (accessData.login != null &&
        accessData.password != null &&
        accessData.userId != null) {
      email = accessData.login?.toLowerCase() ?? '';
      password = accessData.password ?? '';
      userId = accessData.userId ?? '';
      login();
    } else {
      Modular.to.pushReplacementNamed('/auth'); // Linha original

    }
  }

  void login() async {
    var db = FirebaseFirestore.instance;
    try {
      await LocalData.saveAccessData(
          AccessData(login: email, password: password, userId: userId));

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.toLowerCase().trim(), password: password.trim())
          .then((value) => userId = value.user?.uid ?? '');

      // Modular.to.pushNamed('/doctor');
      await db
          .collection("usuarios")
          .where(FieldPath.documentId, isEqualTo: userId)
          .get()
          .then((value) {
        // Doctor.fromJson(value.docs.single.data());
        Modular.to.popUntil((route) => route.isFirst);
        if (value.docs.single['isFono'] == true) {
          Modular.to.pushNamed('/doctor', arguments: userId);
        } else if (value.docs.single['isFono'] == false) {
          Modular.to.pushNamed('/patient', arguments: value.docs.single.data());
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ErrorNotification().call(
            title: 'Erro', subtitle: 'Credenciais inválidas, tente novamente!');
      } else if (e.code == 'wrong-password') {
        ErrorNotification().call(title: 'Erro', subtitle: 'Senha incorreta!');
      } else if (e.code == 'invalid-email') {
        ErrorNotification()
            .call(title: 'Erro', subtitle: 'E-mail inválido, tente novamente!');
      } else if (e.code == 'user-not-found') {
        ErrorNotification()
            .call(title: 'Erro', subtitle: 'Usuário não encontrado!');
      }
      await LocalData.deleteAccessData();
      Modular.to.popUntil((route) => route.isFirst);
    }
  }

  @override
  void dispose() {}
}
