import 'package:apprax/app/modules/patient/mocks/lessons_mock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/models/new_lesson.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';
import '../../../mocks/patient_mock.dart';
import '../../../widgets/be_premiun.dart';
import '../../../../../core/models/patient.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/lesson_widget.dart';
import '../lessons_controller.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends ModularState<LessonsPage, LessonsController> {
  Map<String, dynamic> patientData = Modular.args.data;

  @override
  void initState() {
    super.initState();
    controller.getLessonList();
    controller.getPatient(patientData);
    patientData.forEach((key, value) {
      print('$key, $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return FutureBuilder<QuerySnapshot>(
        future: controller.lesson,
        builder: (context, snapshot) {
          print('Passou no Builder 1');
          if (!snapshot.hasData) {
            return SimpleLoaderWidget(
              key: Key('lessonLoader'),
            );
          } else {
            List lessonsid = [];
            snapshot.data!.docs.forEach((element) {
              print(
                  "Id da lição e licao: ${element.id} e ${element.data()}"); // pega essa porra (element.id) bem aqui e enfia numa variável
              lessonsid.add([element.id, element.data()]);
            });
            final lessons = snapshot.data!.docs
                as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
            return Scaffold(
                appBar: _appBar(height),
                body: _lessons(lessons, width, height, lessonsid));
          }
        });
  }

  _appBar(double height) => AppBar(
        elevation: 0,
        toolbarHeight: height * .08,
        title: Text(
          'Lições',
          style: AppTypography.h1.copyWith(color: AppColors.black_88,),
        ),
        actions: [
          // BePremium(
          //   ontap: () {},
          //   color: AppColors.primary,
          // )
        ],
      );

  _lessons(List<QueryDocumentSnapshot<Map<String, dynamic>>> lessons,
      double width, double height, List lessonId) {
    // Patient patient = controller.patientSnapshot
    //     .then((value) => Patient.fromJson(value.data()!)) as Patient;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          var lesson = NewLesson.fromJson(lessons[index].data());
          return LessonWidget(
            lesson: lesson,
            lock: controller.getLessonStatus(
                lesson, controller.patient.nivel.value),
            routeName: '/patient/lessons/activities',
            arguments: [
              lessonId[index],
              controller.patient,
            ],
            color: controller.getBackgroundColor(index),
          );
        },
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 2,
            maxCrossAxisExtent: height * 0.3,
            mainAxisExtent: height * .35),
      ),
    );
  }
}
