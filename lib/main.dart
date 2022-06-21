/// ORDEM DOS IMPORTS:
/// Libs do Dart
/// Libs do Flutter
/// Libs 3rd Party
/// Libs 1st Party (nossas)
/// Arquivos fora da pasta do módulo
/// Arquivos do módulo

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'firebase_options.dart';

void main() async {
  /* ErrorWidget.builder = ((details) => Scaffold(
        body: Center(
          child: Text('Opss!\nParece que algo não está certo'),
        ),
      )); */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
