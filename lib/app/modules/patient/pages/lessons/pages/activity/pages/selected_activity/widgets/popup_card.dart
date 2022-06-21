import 'package:apprax/app/core/models/new_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:apprax/app/core/styles/colors.dart';
import 'package:apprax/app/core/styles/typography.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:uuid/uuid.dart';

import '../selected_activity_controller.dart';

class PopUpCard extends StatefulWidget {
  final String? path;
  final List? arguments;

  const PopUpCard({
    Key? key,
    required this.path,
    required this.arguments,
  }) : super(key: key);

  @override
  State<PopUpCard> createState() => _PopUpCardState();
}

class _PopUpCardState
    extends ModularState<PopUpCard, SelectedActivityController> {
  final color = 0x52A3D0;

  @override
  void initState() {
    super.initState();
    print('========================ABRINDO PLAYER===========================');
    controller.initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.disposePlayer();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.path);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RxBuilder(
            builder: (context) => OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                side: BorderSide(color: AppColors.primary),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () async {
                await controller.play(widget.path!);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Reproduzir',
                      style: AppTypography.button,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: const Icon(
                        Icons.play_arrow,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(width: 2, color: AppColors.primary)),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Se o áudio estiver ok,\nclique em enviar.',
              style: AppTypography.body,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      title: Text(
        'Clique no botão abaixo para reproduzir a gravação.',
        style: AppTypography.h3,
        textAlign: TextAlign.center,
      ),
      actions: [
        RxBuilder(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.isSending.value
                ? [CircularProgressIndicator()]
                : [
                    ElevatedButton(
                      style:
                          elevatedButtonStyle(width, height, Color(0xFFEC407A)),
                      onPressed: controller.isPlayed.value
                          ? () async {
                              await controller.stopPlayer();

                              Navigator.pop(context);
                            }
                          : null,
                      child: Text('Regravar',
                          style: AppTypography.button
                              .copyWith(color: Colors.white,)),
                    ),
                    ElevatedButton(
                      style:
                          elevatedButtonStyle(width, height, AppColors.primary),
                      onPressed: controller.isPlayed.value
                          ? () async {
                              NewActivity activity = widget.arguments![0];
                              String letter =
                                  activity.titulo!.split(' ')[1].toLowerCase();
                              String audioRef = activity.titulo!
                                      .replaceAll(r' ', '_')
                                      .toLowerCase() +
                                  '_audio_' +
                                  DateTime.now().toString();
                              await controller.stopPlayer();
                              //print('Count : ${controller.countG.value}');
                              //controller.count_control(false);
                              //controller.test.value = false;
                              //print(controller.countG.value);
                              List result =
                                  await controller.analyseAndUploadAudio(
                                      audioRef,
                                      widget.path!,
                                      letter,
                                      widget.arguments![1],
                                      widget.arguments![2],
                                      widget.arguments![3]);
                              print(result);
                              Navigator.pop(context);
                              Modular.to.pushNamed(
                                  '/patient/lessons/activities/selected-activity/result-activities',
                                  arguments: [
                                    widget.arguments,
                                    result[0],
                                  ]);
                            }
                          : null,
                      child: Text('Enviar',
                          style: AppTypography.button
                              .copyWith(color: Colors.white,)),
                    ),
                  ],
          ),
        )
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }

  elevatedButtonStyle(double width, double height, Color color) =>
      ElevatedButton.styleFrom(
          fixedSize: Size(width * 0.30, height * 0.035),
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));
}
