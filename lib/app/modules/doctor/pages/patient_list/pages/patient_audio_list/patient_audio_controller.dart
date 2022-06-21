import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../core/enums/request_state.dart';
import '../../../../core/models/doctor.dart';
import 'patient_audio_repository.dart';

class PatientAudioController {
  final PatientAudioRepository
      repository; // Recebo o(s) model(s) do repositório e realizo operações em cima dele(s)

  PatientAudioController({required this.repository});

  var requestState = RxNotifier<RequestState>(RequestState.IDLE);

  late Future<QuerySnapshot<Map<String, dynamic>>> userData;
  late Future<QuerySnapshot<Map<String, dynamic>>> doctorData;
  late Future<QuerySnapshot<Map<String, dynamic>>> patientData;
  // late Future<QuerySnapshot<Map<String, dynamic>>> patientRequestData;
  late Stream<RxList<String>> patientRequestData;

  FlutterSoundPlayer? _audioPlayer;
  AudioPlayer audioPlayer = AudioPlayer();
  RxNotifier<int> played = RxNotifier(0);
  RxNotifier<bool> isPlaying = RxNotifier<bool>(false);
  RxNotifier<String> _feedback = RxNotifier<String>('');

  String get feedback => _feedback.value;
  set feedback(String value) => _feedback.value = value;

  final _doctor = RxNotifier<Doctor>(Doctor());

  Doctor get doctor => _doctor.value;
  set doctor(Doctor doctor) => _doctor.value = doctor;

  final _doctorUserId = RxNotifier<String>('');

  String get doctorUserId => _doctorUserId.value;
  set doctorUserId(String doctor) {
    _doctorUserId.value = doctor;
  }

  void getProfileData() async {
    requestState.value = RequestState.LOADING;
    userData = repository.fetchUserData(doctorUserId);
    userData.then((value) {
      doctor = Doctor.fromJson(value.docs.first.data());
      doctor.id = doctorUserId;
      getPatientRequestData();
    });
  }

  void getPatientRequestData() async {
    patientRequestData = Stream.value(
        RxList.of(['Rogério Silva', 'Valéria', 'Rômulo', 'Romero']));
    requestState.value = RequestState.SUCCESS;
  }

  // Future<void> play(String path) async {
  //   await _audioPlayer?.startPlayer(
  //       fromURI: path,
  //       sampleRate: 16000,
  //       numChannels: 1,
  //       codec: Codec.pcm16WAV);
  //   isPlaying.value = true;
  // }

  void sendFeedback() {
    print('enviado');
  }
}
