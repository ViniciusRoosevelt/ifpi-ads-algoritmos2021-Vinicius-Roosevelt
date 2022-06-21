import 'package:apprax/app/core/models/new_activity.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'user_activity.dart';

class NewLesson {
  String? id;
  String? nivel;
  String? titulo;
  String? corpo;
  RxList<NewActivity> atividades = RxList<NewActivity>();

  NewLesson({this.id, this.titulo, this.corpo, required this.atividades});

  NewLesson.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    nivel = json['nivel'] ?? '';
    titulo = json['titulo'] ?? '';
    corpo = json['corpo'] ?? '';
    if (json['atividades'] != null) {
      json['atividades'].forEach((v) {
        atividades.add(NewActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nivel'] = this.nivel;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    data['atividades'] = this.atividades;
    return data;
  }
}
