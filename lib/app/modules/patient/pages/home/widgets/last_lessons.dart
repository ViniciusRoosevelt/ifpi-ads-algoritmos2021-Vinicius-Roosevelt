import 'package:apprax/app/core/models/new_lesson.dart';
import 'package:apprax/app/core/widgets/simple_loader_widget.dart';
import 'package:apprax/app/modules/patient/mocks/lessons_mock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/models/patient.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/lesson_widget.dart';
import '../../../mocks/patient_mock.dart';
import '../../lessons/lessons_controller.dart';
import '../home_controller.dart';

// BUGADO!!!!

class LastLessons extends StatefulWidget {
  final Patient patient;

  LastLessons({Key? key, required this.patient}) : super(key: key);

  @override
  State<LastLessons> createState() => _LastLessonsState();
}

class _LastLessonsState extends ModularState<LastLessons, HomeController> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.getLessonList();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // List<NewLesson> licoes = lessonsMock;
    late int tamanhoList = 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              'Suas últimas Lições:',
              style: AppTypography.h1,
              textScaleFactor: height * 0.0012,
            ),
          ),
          SizedBox(
            height: height * 0.35,
            child: FutureBuilder<QuerySnapshot>(
              future: controller.lesson,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SimpleLoaderWidget(
                    key: Key(
                      ('lessonLoader'),
                    ),
                  );
                } else {
                  final lessons = snapshot.data!.docs
                      as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
                  snapshot.data!.docs.forEach((element) {
                    controller.lessonsId.add(element.id);
                  });
                  return _filter(lessons, widget.patient, height);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _filter(List<QueryDocumentSnapshot<Map<String, dynamic>>> licoes,
      Patient paciente, double height) {
    return GridView.builder(
      //reverse: true,
      scrollDirection: Axis.horizontal,
      itemCount: licoes.length,
      itemBuilder: (BuildContext context, int index) {
        NewLesson lessontratada = NewLesson.fromJson(licoes[index].data());
        if (int.parse(lessontratada.nivel!) <=
            int.parse(paciente.nivel.value)) {
          // print('LessonID no Index: ${controller.lessonId[index]}');
          return LessonWidget(
            lock: true,
            lesson: lessontratada,
            routeName: '/patient/lessons/activities',
            arguments: [
              [
                controller.lessonsId[index][0],
                {
                  'corpo': lessontratada.corpo,
                  'titulo': lessontratada.titulo,
                  'nivel': lessontratada.nivel
                }
              ],
              widget.patient,
            ],
            color: controller.getBackgroundColor(index),
          );
        } else {
          print('a');
          return Container();
        }
      },
      // _filter(licoes, paciente, index, _controller),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //crossAxisExtent: height * 0.3,
          mainAxisExtent: height * 0.25),
    );
  }

  _filter_count(Patient patient, _controller) {
    int count = 0;
    patient.licoes.forEach(
      (x) {
        if (x.bloqueada == false) {
          count += 1;
        }
      },
    );
    return count;
  }
}
