import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:apprax/app/modules/patient/pages/lessons/pages/activity/pages/selected_activity/selected_activity_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';

class SelectedActivityRepository {
  static const String _baseUrl =
      'https://apraxia-flask-app-teste.herokuapp.com/';
  static Uri url = Uri.parse(_baseUrl);
  //SelectedActivityController controller = Modular.get<SelectedActivityController>();

  uploadAudio(
    String path,
    String audioRef,
    String score,
    String idLesson,
    String idActivity,
    int count,
  ) async {
    late String audioUrl;
    final storage =
        FirebaseStorage.instanceFor(bucket: 'gs://apraxiaapp.appspot.com');
    Reference ref = storage.ref('/audios/').child(audioRef);
    UploadTask task = ref.putFile(File(path));

    task.then((value) async {
      audioUrl = await value.ref.getDownloadURL();
      await send_pontuaction2(score, idLesson, idActivity, count, audioUrl);
      //controller.count_control(false);
      print('URL GERADA: $audioUrl');
    });
  }

  Future<dynamic> analyzeAudioWithVosk(String path, String letter) async {
    File file = File(path);
    Uint8List audioConverted = await file.readAsBytes();
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://apraxia-flask-app-teste.herokuapp.com/arquivos"),
    );
    var audio = http.MultipartFile.fromBytes("audio", audioConverted,
        filename: 'audio');
    request.files.add(audio);
    var response = await request.send();
    Uint8List responseData = await response.stream.toBytes();
    String result = String.fromCharCodes(responseData);
    print('RESULT: $result');
    var jsonResult = json.decode(result);
    print("JSON: $jsonResult");
    return jsonResult;
  }

  String? user = FirebaseAuth.instance.currentUser?.uid;

  Future<void> send_pontuaction2(String numer, String idlesson,
      String idActivity, int count, String storagePath) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<List> tentID = [];
    firestore.collection('usuarios').doc(user).get().then(
      (value) {
        if (value.data()!.containsKey('tentativasAtividades')) {
          value.data()?.forEach(
            (key, value) {
              if (key == 'tentativasAtividades') {
                tentID.add(value);
              }
            },
          );
          tentID[0].add(
            {
              'atividade': firestore
                  .collection('licoes')
                  .doc(idlesson)
                  .collection('atividades')
                  .doc(idActivity),
              'data': Timestamp.now(),
              'nota': numer.toString(),
              'quantidadeGravacoes': count.toString(),
              'audio': storagePath.toString(),
            },
          );
        } else {
          tentID.add(
            [
              {
                'atividade': firestore
                    .collection('licoes')
                    .doc(idlesson)
                    .collection('atividades')
                    .doc(idActivity),
                'data': Timestamp.now(),
                'nota': numer.toString(),
                'quantidadeGravacoes': count.toString(),
                'audio': storagePath.toString(),
              }
            ],
          );
        }
        firestore.collection('usuarios').doc(user).update({
          'tentativasAtividades': tentID[0],
        });
      },
    );
  }
}
