import 'package:rx_notifier/rx_notifier.dart';

import 'activity.dart';
import 'activity_attempts.dart';

class UserActivity extends Activity {
  var feita = RxNotifier<bool>(false);
  var tentativas = <ActivityAttempts>[];

  var notaMaxima = RxNotifier<String>('0.0');

  UserActivity();

  UserActivity.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    feita.value = json['feita'];
    if (json['tentativasAtividades'] != null) {
      json['tentativasAtividades'].forEach((v) {
        tentativas.add(ActivityAttempts.fromJson(v));
      });
      tentativas.forEach((tentativa) {
        var notaAtual = double.parse(tentativa.nota.value);
        if (notaAtual > double.parse(notaMaxima.value))
          notaMaxima.value = notaAtual.toString();
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data = super.toJson();
    data['feita'] = this.feita.value;
    data['tentativas'] = this.tentativas;
    data['notaMaxima'] = this.notaMaxima.value;
    return data;
  }
}
