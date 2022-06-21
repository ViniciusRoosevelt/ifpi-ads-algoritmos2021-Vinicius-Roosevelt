import 'package:apprax/app/core/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:better_player/better_player.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../../../../core/images/banner01.dart';
import '../../../../../../../../../core/models/new_activity.dart';
import '../../../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../../../core/images/pet.dart';
import '../../../../../../../../../core/styles/colors.dart';
import '../selected_activity_controller.dart';
import '../widgets/popup_card.dart';

class SelectedActivityPage extends StatefulWidget {
  const SelectedActivityPage({Key? key}) : super(key: key);

  @override
  State<SelectedActivityPage> createState() => _SelectedActivityPageState();
}

class _SelectedActivityPageState
    extends ModularState<SelectedActivityPage, SelectedActivityController> {
  // var controller = Modular.get<UserActivityController>();
  late YoutubePlayerController betterPlayerController;
  // Recorder recorder = Recorder();
  late NewActivity userActivity;
  late String idLesson;
  late String idActivity;

  @override
  void initState() {
    super.initState();
    controller.initRecorder();
    userActivity = Modular.args.data[0];
    idLesson = Modular.args.data[1].toString();
    idActivity = Modular.args.data[2].toString();
    print('Selected Act : ${Modular.args.data}');
    String videoId = '';
    if (userActivity.video != '') {
      videoId = YoutubePlayer.convertUrlToId(userActivity.video!)!;
    }
    betterPlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        loop: true,
        controlsVisibleAtStart: true,
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.disposeRecord();
    betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (ModalRoute.of(context)?.settings.arguments.runtimeType ==
    //     UserActivity) {
    //   appController.userActivityDataBackup =
    //       ModalRoute.of(context)?.settings.arguments as UserActivity;
    // }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    /* return Scaffold(
        body: Scaffold(
      appBar: _appBar(userActivity),
      body: _body(userActivity, width, height),
    )); */
    return CustomScaffold(
      title: '${userActivity.titulo}',
      body: _body(userActivity, width, height),
      height: height,
    );
  }

  _body(NewActivity userActivity, double width, double height) => Container(
        height: height * .85,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: EdgeInsets.only(bottom: height * .16),
                    height: 2,
                    color: AppColors.primary)),
            RxBuilder(
              builder: (context) => Positioned(
                bottom: height * .06,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(controller.isRecording.value
                        ? 'Pressione o botão acima \n para encerrar a gravação'
                        : 'Pressione o botão acima \n para iniciar a gravação', style: AppTypography.body,),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * .12,
              child: Center(
                child: Row(
                  children: [
                    _elevatedButtonBase(width, height, icon: Icons.mic_rounded),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .08),
                  child: YoutubePlayer(
                    controller: betterPlayerController,
                    showVideoProgressIndicator: false,
                  )),
            ),
            Positioned(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    child: Text(
                      userActivity.corpo ?? '',
                      style: AppTypography.body,
                      textScaleFactor: height * 0.0015,
                    ),
                    bottom: height * .105,
                    right: width * .05,
                  ),
                  // SvgPicture.string(
                  //   banner01,
                  //   width: width * .7,
                  // ),
                  Positioned(
                    child: SvgPicture.string(
                      pet,
                      height: height * .2,
                      width: width * 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _elevatedButtonBase(double width, double height, {required IconData icon}) {
    return RxBuilder(
      builder: (context) => ElevatedButton(
        onPressed: () async {
          betterPlayerController.pause();
          String path = await controller.getPath();
          print('Funcionando! ${controller.isRecording.value}');
          if (controller.isRecording.value) {
            controller.count_control(true);
            print(controller.countG.value);
            await controller.stop();
            print(path);
            await showDialog(
                context: context,
                builder: (context) => PopUpCard(
                      path: path,
                      arguments: [
                        userActivity,
                        idLesson,
                        idActivity,
                        controller.countG.value
                      ],
                    ));
          } else {
            await controller.start(path);
          }
        },
        child: Icon(
          controller.isRecording.value ? Icons.stop : Icons.mic,
          size: height * .04,
          color: AppColors.primary,
        ),
        style: _elevatedButtomStyle(width, height),
      ),
    );
  }

  _elevatedButtomStyle(double width, double height) => ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: AppColors.primary,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(60)),
      fixedSize: Size(height * .08, height * .08));
}
  // Center(
  //       child: Container(
  //         margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
  //         height: height * .7,
  //         decoration: BoxDecoration(
  //             color: AppColors.primary,
  //             borderRadius: BorderRadius.circular(24)),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Container(
  //               margin: EdgeInsets.only(left: 20, right: 20, top: height * 0.1),
  //               child: Text(userActivity.corpo ?? '',
  //                   style: AppTypography.h1, textAlign: TextAlign.center),
  //             ),
  //             Container(
  //               margin: EdgeInsets.only(
  //                 left: 20,
  //                 right: 20,
  //                 top: height * .15,
  //                 bottom: 10,
  //               ),
  //               decoration: BoxDecoration(
  //                   color: AppColors.primaryLight,
  //                   borderRadius: BorderRadius.circular(24)),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.only(
  //                         left: width * .08,
  //                         right: width * .08,
  //                         top: height * .02),
  //                     child: Text(
  //                       'Pressione o microfone para gravar sua voz ou então pressione o player para escutar a pronuncia',
  //                       style: AppTypography.h1,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(20.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         _elevatedButtonBase(width, height,
  //                             icon: Icons.mic_rounded),
  //                         SizedBox(
  //                           width: 20,
  //                         ),
  //                         _elevatedButtonBase(width, height,
  //                             icon: Icons.play_circle_outlined),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );




