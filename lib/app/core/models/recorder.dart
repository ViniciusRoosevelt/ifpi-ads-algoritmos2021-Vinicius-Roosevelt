import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../services/directory/directory.dart';
//import 'dart:developer' as d;

class Recorder {
  FlutterSoundRecorder? _audioRecorder;
  RxNotifier<bool> isRecorderInitialized = RxNotifier<bool>(false);
  RxNotifier<bool> isRecording = RxNotifier<bool>(false);

  RxNotifier<String?> path = RxNotifier<String>('');

  init() async {
    path.value = await getCaminho();
    _audioRecorder = FlutterSoundRecorder();
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Permissão do microfone não aceita');
    }
    await _audioRecorder!.openRecorder();
    isRecorderInitialized.value = true;
  }

  Future<String> getCaminho() async {
    return await Directory('/GravacaoApp').getFileName('/audio_atividade.wav');
  }

  dispose() {
    _audioRecorder!.closeRecorder();
    isRecorderInitialized.value = false;
  }

  start() async {
    //if (!_isRecorderInitialized) return;
    await _audioRecorder!.startRecorder(
        toFile: path.value,
        sampleRate: 16000,
        numChannels: 1,
        codec: Codec.pcm16WAV,
        bitRate: 5333);
    isRecording.value = true;
  }

  stop() async {
    await _audioRecorder!.stopRecorder();
    isRecording.value = false;
  }

  Future<void> toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      await start();
    } else {
      await stop();
    }
  }
}
