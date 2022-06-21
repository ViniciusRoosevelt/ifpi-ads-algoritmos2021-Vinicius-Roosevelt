import 'package:apprax/app/core/models/activity.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'user_activity.dart';

class Lesson {
  String? id;
  String? nivel;
  String? titulo;
  String? corpo;
  bool? bloqueada;
  RxList<UserActivity>? atividades = RxList<UserActivity>();

  var notaGeral = RxNotifier<double>(0.0);

  Lesson({this.id, this.titulo, this.corpo, required this.atividades});
  var notaLicao = RxNotifier<double>(0.0);

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    nivel = json['nivel'] ?? '';
    titulo = json['titulo'] ?? '';
    corpo = json['corpo'] ?? '';
    bloqueada = json['bloqueada'];
    // if (json['atividades'] != null) {
    //   json['atividades'].forEach((v) {
    //     atividades.add(UserActivity.fromJson(v));
    //   });
    //   atividades.forEach((notaMaxima) {
    //     var notaProv = double.parse(notaMaxima.notaMaxima.value);
    //     notaLicao.value += notaProv;
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nivel'] = this.nivel;
    data['titulo'] = this.titulo;
    data['corpo'] = this.corpo;
    data['bloqueada'] = this.bloqueada;
    data['notaGeral'] = this.notaGeral.value;
    data['notaLicao'] = this.notaLicao.value;
    data['atividades'] = this.atividades;
    return data;
  }

  // bool get lessonLock => this.bloqueada!;
  // set lessonLock(newStatus) => lessonLock = newStatus;

  // double get lessonScore {
  //   // Retorna pontuação total da Lição
  //   List scoreList = atividades
  //       .map((activity) => double.parse(activity.notaMaxima.value))
  //       .toList();
  //   double pontuacaoTotal =
  //       (scoreList.fold(0, (previous, current) => previous + current));
  //   double media = pontuacaoTotal / atividades.length;
  //   return media;
  // }

  // bool isFinished() {
  //   List<int> statuActivity = [];
  //   this.atividades.forEach((p0) {
  //     p0.feita.value ? 1 : 0;
  //   });
  //   int sum = statuActivity.fold(0, (previous, current) => previous + current);
  //   print(sum == this.atividades.length);
  //   if (sum == this.atividades.length) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
