import 'dart:async';

import 'package:apprax/app/core/models/activity_attempts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'result_activities_repository.dart';

class ResultActivitiesController {
  final ResultActivitiesRepository repository;

  ResultActivitiesController({required this.repository});

  String? user = FirebaseAuth.instance.currentUser?.uid;

  // Future<void> send_pontuaction2(String numer, String idlesson,
  //     String idActivity, int count, String storagePath) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   List<List> tentID = [];
  //   firestore.collection('usuarios').doc(user).get().then(
  //     (value) {
  //       if (value.data()!.containsKey('tentativasAtividades')) {
  //         value.data()?.forEach(
  //           (key, value) {
  //             if (key == 'tentativasAtividades') {
  //               tentID.add(value);
  //             }
  //           },
  //         );
  //         tentID[0].add(
  //           {
  //             'atividade': firestore
  //                 .collection('licoes')
  //                 .doc(idlesson)
  //                 .collection('atividades')
  //                 .doc(idActivity),
  //             'data': Timestamp.now(),
  //             'nota': numer.toString(),
  //             'quantidadeGravacoes': count.toString(),
  //             'audio': storagePath.toString(),
  //           },
  //         );
  //       } else {
  //         tentID.add(
  //           [
  //             {
  //               'atividade': firestore
  //                   .collection('licoes')
  //                   .doc(idlesson)
  //                   .collection('atividades')
  //                   .doc(idActivity),
  //               'data': Timestamp.now(),
  //               'nota': numer.toString(),
  //               'quantidadeGravacoes': count.toString(),
  //               'audio': storagePath.toString(),
  //             }
  //           ],
  //         );
  //       }
  //       firestore.collection('usuarios').doc(user).update({
  //         'tentativasAtividades': tentID[0],
  //       });
  //     },
  //   );
  // }
}

/* {
              'telefone' : '8631234567',
              'fotoPerfil': 'https://static.wikia.nocookie.net/finalfantasy/images/2/2d/Vivi_Ornitier_character.jpg/revision/latest?cb=20121122215148&path-prefix=pt-br',
              'dataDeInicio': Timestamp(1650423600, 0),
              'nome': 'Vivi Ornitier',
              'isAdmin': false,
              'dadosConta': firestore.collection('pacientes').doc('OQpiVmIlVgN0ueGoTAUC'),
              'cep': '64000000',
              'isFono': false,
              'cpf': '12345678909',
              'tentativasAtividades': [{'atividade': firestore.collection('licoes').doc('1').collection('atividades').doc('1'), 'data': Timestamp(1652791896, 910424000), 'quantidadeGravacoes': 2, 'nota': 90}, {'atividade': firestore.collection('licoes').doc('1').collection('atividades').doc('1'), 'data': Timestamp(1650423600, 0), 'quantidadeGravacoes': 3, 'nota': 50}],
              'celular': '86981234567',
              'meuFonoaudiologo': firestore.collection('usuarios').doc('uaECBdaagbhbWUepSHxNqzqKHE93'),
              'dataNascimento': Timestamp(1242788400, 0),
              'nivel': '1',
              'email': 'teste@gmail.com',
            } */
