import 'package:rx_notifier/rx_notifier.dart';

class ActivityAttempts {
  var atividade = RxNotifier<String>('');
  var data = RxNotifier<String>('');
  var nota = RxNotifier<String>('');
  var quantidadeGravacoes = RxNotifier<String>('');
  var audio = RxNotifier<String>('');

  ActivityAttempts.fromJson(Map<String, dynamic> json) {
    atividade.value = json['atividade'] ?? '';
    data.value = json['data'] ?? '';
    nota.value = json['nota'] ?? '';
    quantidadeGravacoes.value = json['quantidadeGravacoes'] ?? '1';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['atividade'] = this.id.value.split(' ')[1];
    data['data'] = this.data.value;
    data['nota'] = this.nota.value;
    data['quantidadeGravacoes'] = this.quantidadeGravacoes.value;

    return data;
  }
}
