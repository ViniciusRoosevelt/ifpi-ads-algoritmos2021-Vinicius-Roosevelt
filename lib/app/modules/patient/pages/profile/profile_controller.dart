import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/patient.dart';
import 'profile_repository.dart';

class ProfileController {
  final ProfileRepository repository;

  ProfileController({
    required this.repository,
  });

  late Patient patient;

  void editProfile() {
    Modular.to.navigate('/patient/profile/editProfile');
  }

  void getPatient(Map<String, dynamic> json) async {
    patient = Patient.fromJson(json);
  }
}
