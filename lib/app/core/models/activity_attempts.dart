import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ActivityAttempts {
  var id = RxNotifier<String>('');
  var atividade = RxNotifier<String>('');
  var data = RxNotifier<String>('');
  var nota = RxNotifier<String>('');
  var quantidadeGravacoes = RxNotifier<String>('');

  ActivityAttempts.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json['data'];
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000)
        .toString();
    DocumentReference<Map<String, dynamic>> document = json['atividade'];
    var doc = document.path.toString();
    atividade.value = doc;
    id.value = 'Tentativa ${json['id'] ?? ''}';
    data.value = date;
    nota.value = json['nota'] ?? '';
    quantidadeGravacoes.value = json['quantidadeGravacoes'] ?? '1';
  }

  // Timestamp timestamp = json['dataDeInicio'];
  //   print('TIME: $timestamp');
  //   var date = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000)
  //       .toString();
  //   print('DATE: $date');
  //   dataDeInicio = date;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atividade'] = this.atividade.value.split(' ')[1];
    data['data'] = this.data.value;
    data['nota'] = this.nota.value;
    data['quantidadeGravacoes'] = this.quantidadeGravacoes.value;

    return data;
  }
}
