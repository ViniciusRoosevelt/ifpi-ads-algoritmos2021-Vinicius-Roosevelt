import 'package:rx_notifier/rx_notifier.dart';

import 'activity_attempts.dart';

class PatientActivitiesData {
  String? id;
  String? atividade;
  RxList<ActivityAttempts> tentativas = RxList<ActivityAttempts>();

  PatientActivitiesData({
    this.id,
    this.atividade,
    required this.tentativas,
  });

  PatientActivitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    atividade = json['atividade'];
    tentativas = json['tentativas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['atividade'] = this.atividade;
    data['tentativas'] = this.tentativas;

    return data;
  }

  String get notaMaxima {
    double notaMaxima = 0;
    tentativas.forEach((tentativas) {
      double notaDaTentativa = double.parse(tentativas.nota.value);
      if (notaDaTentativa > notaMaxima) {
        notaMaxima = notaDaTentativa;
      }
    });
    return notaMaxima.toString();
  }
}
