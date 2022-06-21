import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'patient_repository.dart';

class PatientController {
  final PatientRepository repository;
  var bottomNavIndex = RxNotifier<int>(0);
  var pageController = PageController();
  // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)

  PatientController({required this.repository});

  void getPermission() async {
    PermissionStatus micStatus = await Permission.microphone.request();
    PermissionStatus storageStatus = await Permission.storage.request();
  }
}
