import 'package:rx_notifier/rx_notifier.dart';

import 'patient.dart';
import 'user.dart';

class Doctor extends User {
  String? regiaoConselho;
  String? numeroConselho;
  RxList<Patient> pacientes = RxList.of(<Patient>[]);
  RxNotifier<int> quantidadeDePacientes = RxNotifier(0);
  Doctor();

  Doctor.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.numeroConselho = json['numeroConselho'] ?? '';
    this.regiaoConselho = json['regiaoConselho'] ?? '';
    // if (json['pacientes'] != null) {
    //   json['pacientes'].forEach((v) {
    //     pacientes.add(Patient.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data = super.toJson();
    data['numeroConselho'] = this.numeroConselho;
    data['regiaoConselho'] = this.regiaoConselho;
    // data['pacientes'] = this.pacientes;
    return data;
  }
}
