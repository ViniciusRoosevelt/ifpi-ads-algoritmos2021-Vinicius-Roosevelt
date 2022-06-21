import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../../../../core/widgets/input/app_input_text.dart';
import '../../../../../../../core/widgets/notifications/success_notification.dart';
import '../patient_audio_controller.dart';

class PlayerAlert extends StatelessWidget {
  PlayerAlert({Key? key, required this.audioUrl}) : super(key: key);

  late String audioUrl;
  AudioPlayer audioPlayer = AudioPlayer();
  RxNotifier<int> played = RxNotifier(0);
  RxNotifier<bool> isPlaying = RxNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var controller = Modular.get<PatientAudioController>();
    return AlertDialog(
      title: Text("Tocar áudio"),
      content: Container(
        height: height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Pressione o botão para ouvir o áudio:"),
            RxBuilder(builder: (context) {
              return FloatingActionButton(
                mini: true,
                onPressed: () async {
                  isPlaying.value = true;
                  await _play(audioUrl);
                },
                child: Icon(
                  isPlaying.value ? Icons.stop : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              );
            }),
            Text("(A primeira reprodução inicia em instantes)"),
            AppInputText(
              hintText: 'Deseja enviar um feedback? (opcional)',
              maxLines: 4,
              onChanged: (feedback) {
                controller.feedback = feedback;
              },
              onFieldSubmitted: (feedback) {
                controller.feedback = feedback;
              },
            ),
          ],
        ),
      ),
      actions: [
        _cancelButton(controller),
        _sendButton(controller),
      ],
    );
  }

  _cancelButton(PatientAudioController controller) => AppTextButton(
        text: "Cancelar",
        onPressed: () {
          Modular.to.pop(false);
          audioPlayer.stop();
          controller.feedback = '';
        },
      );
  _sendButton(PatientAudioController controller) =>
      RxBuilder(builder: (context) {
        return AppTextButton(
          text: "Enviar",
          onPressed: controller.feedback.isNotEmpty
              ? () {
                  controller.sendFeedback();
                  Modular.to.pop(true);
                  SuccessNotification().call(
                      title: 'Sucesso', subtitle: 'Seu feedback foi enviado!');
                }
              : null,
        );
      });
  _play(String path) async {
    isPlaying.value = true;
    played.value = await audioPlayer.play(path);
    if (played.value == 1) {
      played.value = 0;
      isPlaying.value = false;
    }
  }
}
