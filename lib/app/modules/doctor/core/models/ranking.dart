import 'package:rx_notifier/rx_notifier.dart';

import 'patient.dart';

class Ranking {
  RxList<Patient> pacientes = RxList<Patient>();

  Ranking();

  Ranking.fromJson(Map<String, dynamic> json) {
    if (json['pacientes'] != null) {
      json['pacientes'].forEach((v) {
        pacientes.add(Patient.fromJson(v));
      });
    }
  }

  static List<Ranking>? fromJsonList(List list) {
    if (list == null) return null;
    return list.map<Ranking>((item) => Ranking.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['pacientes'] = this.pacientes;
    return data;
  }
}
