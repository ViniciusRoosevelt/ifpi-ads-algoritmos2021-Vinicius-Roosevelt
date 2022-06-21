import 'package:apprax/app/core/models/patient.dart';
import 'package:apprax/app/modules/patient/mocks/patient_mock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../core/models/new_lesson.dart';
import '../../../../core/styles/colors.dart';
import 'lessons_repository.dart';

class LessonsController {
  final LessonsRepository repository;

  LessonsController({
    required this.repository,
  });

  late Future<QuerySnapshot<Map<String, dynamic>>> lesson;
  late Patient patient;

  getBackgroundColor(int index) {
    switch (index % 5) {
      case 0:
        return AppColors.primary;
      case 1:
        return AppColors.secondary;
      case 2:
        return AppColors.terciary;
      case 3:
        return AppColors.quarternary;
      case 4:
        return AppColors.dangerDark;
    }
  }

  void getPatient(Map<String, dynamic> json) async {
    patient = Patient.fromJson(json);
    print(patient.atividadesFeitas);
  }

  void getLessonList() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    lesson = firestore.collection('licoes').get();
  }

  bool getLessonStatus(NewLesson lesson, String nivel) =>
      int.parse(nivel) >= int.parse(lesson.nivel!);

  // void _setLessonStatus(Lesson lesson, bool newStatus) {
  //   lesson.bloqueada = newStatus;
  // }

  // unlockNextLesson(Patient patient) {
  //   List<Lesson> lessons = patient.licoes;
  //   List.generate(lessons.length, (index) {
  //     if (lessons[index] != lessons.last) {
  //       if (lessons[index].lessonScore > 60.00 &&
  //           lessons[index + 1].lessonLock == true) {
  //         _setLessonStatus(lessons[index + 1], false);
  //         print(lessons[index].lessonScore);
  //       }
  //     }
  //   });
  // }
}
