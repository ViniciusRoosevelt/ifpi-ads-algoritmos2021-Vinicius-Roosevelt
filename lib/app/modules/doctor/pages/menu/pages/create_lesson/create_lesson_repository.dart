// Classe para requisitar os dados em JSON via API e convertê-los para Models

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateLessonRepository {
  var firestore = FirebaseFirestore.instance;

  Future<void> createLesson(Map<String, dynamic> lessonData) {
    firestore.collection('licoes').get().then((value) {
      String lessonId = (int.parse(value.docs.last.id) + 1).toString();
      firestore.collection('licoes').doc(lessonId).set({
        'titulo': lessonData['titulo'],
        'corpo': lessonData['corpo'],
        'nivel': lessonData['nivel']
      }).whenComplete(() {
        for (int i = 0; i < lessonData['atividades'].length; i++) {
          firestore
              .collection('licoes/$lessonId/atividades')
              .doc((i + 1).toString())
              .set(lessonData['atividades'][i]);
        }
      });
    });
    return Future.value();
  }
}
