import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../core/models/patient.dart';
import 'user_activity_repository.dart';

class UserActivityController {
  final UserActivityRepository repository;

  UserActivityController({
    required this.repository,
  });
  final _isReproducing = RxNotifier<bool>(false);

  late Future<QuerySnapshot<Map<String, dynamic>>> activitys;

  bool get isReproducing => _isReproducing.value;
  set isReproducing(bool value) => _isReproducing.value = value;

  void reproduce() {
    isReproducing = !isReproducing;
  }

  void getActivities(id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    activitys = firestore
        .collection('licoes')
        .doc(id) // pegar o ID da lição clicada (element.id)
        .collection('atividades')
        .get();
  }

  String getAttemptsOfActivity(Patient patient, String lessonId,
      String activityId, String activityTitle) {
    int attemptCount = 0;
    int id = 0;
    double maxGrade = 0.0;
    List<Map<String, dynamic>> activityAttempts = [];
    patient.tentativasAtividades.forEach((attempt) {
      String codigoAtividade = attempt['atividade'].path;
      codigoAtividade =
          codigoAtividade.split('/')[1] + codigoAtividade.split('/')[3];

      if (codigoAtividade == (lessonId + activityId)) {
        if (double.parse(attempt['nota']) > maxGrade) {
          maxGrade = double.parse(attempt['nota']);
        }

        activityAttempts.add(attempt);
      }
      print(maxGrade);
    });

    return maxGrade.toString();
  }
}
