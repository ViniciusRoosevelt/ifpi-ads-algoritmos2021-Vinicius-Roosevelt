import 'package:rx_notifier/rx_notifier.dart';

import 'core/models/doctor.dart';
import 'core/models/patient.dart';
import 'core/models/user_activity.dart';

class AppController {
  // final _patientDataBackup = RxNotifier<Patient>(Patient());

  // Patient get patientDataBackup => _patientDataBackup.value;
  // set patientDataBackup(Patient patient) => _patientDataBackup.value = patient;

  // final _doctorDataBackup = RxNotifier<Doctor>(Doctor());

  // Doctor get doctorDataBackup => _doctorDataBackup.value;
  // set doctorDataBackup(Doctor doctor) {
  //   _doctorDataBackup.value = doctor;
  //   _doctorDataBackup.value.pacientes
  //       .sort((patient1, patient2) => patient1.nome!.compareTo(patient2.nome!));
  // }

  // final _userActivityDataBackup = RxNotifier<UserActivity>(UserActivity());

  // UserActivity get userActivityDataBackup => _userActivityDataBackup.value;
  // set userActivityDataBackup(UserActivity userActivity) =>
  //     _userActivityDataBackup.value;

  AppController();
}
