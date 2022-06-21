import 'package:apprax/app/core/models/data_activity_done.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'lesson.dart';
import 'user.dart';
import 'user_activity.dart';

class Patient extends User {
  RxNotifier<String> _dataDeInicio = RxNotifier<String>('');
  bool isPremium = false;
  RxNotifier<String> nivel = RxNotifier<String>('');
  RxList<PatientActivitiesData> atividadesFeitas =
      RxList<PatientActivitiesData>();
  RxList<Map<String, dynamic>> tentativasAtividades =
      RxList<Map<String, dynamic>>();
  RxList<Lesson> licoes = RxList<Lesson>();
  var notalGeral = RxNotifier<double>(0.0);
  RxNotifier<String?> meuFonoaudiologo = RxNotifier('');

  String get dataDeInicio {
    return _dataDeInicio.value;
  }

  set dataDeInicio(String value) => _dataDeInicio.value = value;

  Patient();

  Patient.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    var date = UtilData.obterDataDDMMAAAA(
        DateTime.parse(json['dataDeInicio'].toDate().toString()));
    print('DATE: $date');
    dataDeInicio = date;
    isPremium = json['isPremium'];
    nivel.value = json['nivel'];
    meuFonoaudiologo.value = json['meuFonoaudiologo'].toString();

    if (json['atividadesFeitas'] != null) {
      json['atividadesFeitas'].forEach((atividadeFeita) =>
          atividadesFeitas.add(PatientActivitiesData.fromJson(atividadeFeita)));
    }

    if (json['tentativasAtividades'] != null) {
      json['tentativasAtividades']
          .forEach((tentativa) => tentativasAtividades.add(tentativa));
    }

    if (json['licoes'] != null) {
      json['licoes'].forEach((v) {
        licoes.add(Lesson.fromJson(v));
      });

      licoes.forEach((licao) {
        notalGeral.value += licao.notaLicao.value;
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data = super.toJson();
    data['dataDeInicio'] = this.dataDeInicio;
    data['isPremium'] = this.isPremium;
    data['nivel'] = this.nivel.value;
    data['licoes'] = this.licoes;
    data['notaGeral'] = this.notalGeral.value;
    data['meuFonoaudiologo'] = this.meuFonoaudiologo.value;
    return data;
  }
}
