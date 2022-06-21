import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rx_notifier/rx_notifier.dart';

import 'core/models/patient.dart';
import 'doctor_repository.dart';

class DoctorController implements Disposable {
  final DoctorRepository
      repository; // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)
  var bottomNavIndex = RxNotifier<int>(0);
  var pageController = PageController();

  final _patientDataBackup = RxNotifier<Patient>(Patient());

  Patient get patientDataBackup => _patientDataBackup.value;
  set patientDataBackup(Patient patient) => _patientDataBackup.value = patient;

  final _doctorUserIdBackup = RxNotifier<String>('');

  String get doctorUserIdBackup => _doctorUserIdBackup.value;
  set doctorUserIdBackup(String userId) => _doctorUserIdBackup.value = userId;

  DoctorController({required this.repository});

  @override
  void dispose() {
    pageController.dispose();
  }
}
