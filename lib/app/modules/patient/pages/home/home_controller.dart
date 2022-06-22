import 'dart:convert';

import 'package:apprax/app/core/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../core/models/doctor.dart';
import '../../../../core/models/new_lesson.dart';
import '../../../../core/styles/colors.dart';
import 'home_repository.dart';
import 'pages/home_page.dart';

class HomeController {
  final HomeRepository repository;

  HomeController({required this.repository});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Patient patient;
  late Future<DocumentSnapshot<Map<String, dynamic>>> meuFonoaudiologo;

  late Future<QuerySnapshot<Map<String, dynamic>>> lesson;
  late Map<String, dynamic> list = Map();

  late List lessonsId = [];

  String? user = FirebaseAuth.instance.currentUser?.uid;
  late RxNotifier<bool> isPremium = RxNotifier<bool>(false);

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
  }

  void getLessonList() async {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    lesson = firestore.collection('licoes').get();
    print(lesson);
  }

  bool getLessonStatus(NewLesson lesson, String nivel) =>
      int.parse(nivel) >= int.parse(lesson.nivel!);

  void getDoctor(String? doctorRef) {
    meuFonoaudiologo = firestore.doc(doctorRef ?? 'vazio/fono').get();

    print('GET DOCTOR: ${meuFonoaudiologo}');
  }

  void bePremium() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('usuarios').doc(user).get().then((value) {
      value.data()?.forEach((key, ValueKey) {
        if (ValueKey == false) {
          firestore
              .collection('usuarios')
              .doc(user)
              .update({'isPremium': true});
        } else {
          firestore
              .collection('usuarios')
              .doc(user)
              .update({'isPremium': false});
        }
      });
    });
  }

  bool getPremium() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('usuarios').doc(user).get().then(
      (value) {
        value.data()?.forEach((key, ValueKey) {
          if (key == 'isPremium') {
            if (ValueKey == false) {
              isPremium.value = false;
              /*  firestore
              .collection('usuarios')
              .doc(user)
              .update({'meuFonoaudiologo': 'vazio/fono'});
              Campo meuFonoaudiologo atualiza para vazio
               */
            } else {
              isPremium.value = true;
            }
          }
        });
      },
    );

    return isPremium.value;
  }

  getFonos() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    late Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
        firestore.collection('usuarios').where('isFono', isEqualTo: true).get();
    snapshot.then((value) {
      value.docs.forEach((e) {
        list = e.data();
      });
    });
    return list;
  }
}
