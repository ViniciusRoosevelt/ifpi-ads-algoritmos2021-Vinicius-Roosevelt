import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../../../core/services/directory/directory.dart';
import 'selected_activity_repository.dart';

class SelectedActivityController {
  final SelectedActivityRepository repository;

  SelectedActivityController(this.repository);
  FlutterSoundPlayer? _audioPlayer;
  FlutterSoundRecorder? _audioRecorder;
  RxNotifier<bool> isRecorderInitialized = RxNotifier<bool>(false);
  RxNotifier<bool> isRecording = RxNotifier<bool>(false);
  RxNotifier<bool> isPlaying = RxNotifier<bool>(false);
  RxNotifier<bool> isPlayed = RxNotifier<bool>(false);
  RxNotifier<bool> isSending = RxNotifier(false);
  RxNotifier<int> countG = RxNotifier<int>(1);
  RxNotifier<bool> test = RxNotifier(true);

  initRecorder() async {
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Permissão do microfone não aceita');
    }

    await _audioRecorder!.openRecorder();
    isRecorderInitialized.value = true;
  }

  disposeRecord() async {
    await _audioRecorder!.closeRecorder();
    isRecorderInitialized.value = false;
  }

  initPlayer() async {
    _audioPlayer = FlutterSoundPlayer();
    await _audioPlayer!.openPlayer();
  }

  disposePlayer() async {
    await _audioPlayer!.closePlayer();
  }

  Future<String> getPath() async {
    return await Directory('/GravacaoApp').getFileName('/audio_atividade.wav');
  }

  start(path) async {
    //if (!_isRecorderInitialized) return;

    print(
        '====================>>>>>>>>>>>>CAMINHO DO ÀUDIO ${path}<<<<<<<<<<<<========================');
    await _audioRecorder!.startRecorder(
        toFile: path,
        sampleRate: 16000,
        numChannels: 1,
        codec: Codec.pcm16WAV,
        bitRate: 5333);
    isRecording.value = !isRecording.value;
  }

  stop() async {
    await _audioRecorder!.stopRecorder();
    isRecording.value = !isRecording.value;
  }

  // Future<void> toggleRecording() async {
  //   if (_audioRecorder!.isStopped) {
  //     await start();
  //   } else {
  //     await stop();
  //   }
  // }

  Future<void> play(String path) async {
    await _audioPlayer?.startPlayer(
        fromURI: path,
        sampleRate: 16000,
        numChannels: 1,
        codec: Codec.pcm16WAV);
    isPlaying.value = true;
    isPlayed.value = true;
  }

  Future<void> stopPlayer() async {
    await _audioPlayer?.stopPlayer();
  }

  void count_control(bool isControl) {
    if (isControl == true) {
      countG.value += 1;
    } else {
      countG.value = 1;
    }
  }

  Future<List> analyseAndUploadAudio(
    String audioRef,
    String path,
    String letter,
    String idLesson,
    String idActivity,
    int count,
  ) async {
    isSending.value = true;

    var result = await repository.analyzeAudioWithVosk(path, letter);
    print('RESULTADO DA ANÀLISE: $result');
    String score = getScore(letter, result); //Tranformado em String
    print('SCORES: $score');
    isSending.value = false;
    print('Entrou!');
    await repository.uploadAudio(
        path, audioRef, score, idLesson, idActivity, count);

    return [score];
  }

  String getScore(String pronunciation, dynamic pronounced) {
    const Map<String, dynamic> equivalences = {
      'i': 'iê',
      'ê': 'iéê',
      'é': 'êaé',
      'a': 'éãa',
      'u': 'ôu',
      'ô': 'uoô',
      'ó': 'ôó'
    };

    String equivalence = equivalences[pronunciation];
    List<String> equivalent = equivalence.split('');
    double score = 0;

    equivalent.forEach((item) {
      pronounced.forEach((map) {
        print('Entrou');
        if ((map['letter']).toString().contains(item)) {
          score += map['value'];
        }
      });
    });

    return score.toStringAsFixed(2);
  }
}
