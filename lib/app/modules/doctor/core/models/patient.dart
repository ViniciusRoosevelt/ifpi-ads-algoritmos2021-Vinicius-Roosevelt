import 'package:brasil_fields/brasil_fields.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../core/models/data_activity_done.dart';
import 'activity_attempts.dart';
import 'lesson.dart';
import 'user.dart';
import 'user_activity.dart';

class Patient extends User {
  String? dataDeInicio;
  RxNotifier<String> nivel = RxNotifier<String>('1');
  RxList<DataActivityDone> atividadesFeitas = RxList<DataActivityDone>();
  RxList<Map<String, dynamic>> tentativasAtividades =
      RxList<Map<String, dynamic>>();
  RxList<ActivityAttempts> tentativasAtividadesObjeto =
      RxList<ActivityAttempts>();
  RxList<Lesson> licoes = RxList<Lesson>();
  var notalGeral = RxNotifier<double>(0.0);

  Patient();

  Patient.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    dataDeInicio = UtilData.obterDataDDMMAAAA(
        DateTime.parse((json['dataDeInicio'] ?? '').toDate().toString()));
    nivel.value = json['nivel'] ?? '1';

    if (json['atividadesFeitas'] != null) {
      json['atividadesFeitas'].forEach((atividadeFeita) =>
          atividadesFeitas.add(DataActivityDone.fromJson(atividadeFeita)));
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
    data['nivel'] = this.nivel.value;
    data['licoes'] = this.licoes;
    data['notaGeral'] = this.notalGeral.value;
    return data;
  }
}
