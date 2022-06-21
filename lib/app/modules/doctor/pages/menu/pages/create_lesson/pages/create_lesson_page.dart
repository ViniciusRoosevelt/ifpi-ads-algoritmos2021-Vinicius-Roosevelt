import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/enums/request_state.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../core/widgets/input/app_input_text.dart';
import '../../../../../../../core/widgets/notifications/success_notification.dart';
import '../../../../../../../core/widgets/simple_loader_widget.dart';
import '../create_lesson_controller.dart';

class CreateLessonPage extends StatefulWidget {
  CreateLessonPage({Key? key}) : super(key: key);

  @override
  State<CreateLessonPage> createState() => _CreateLessonPageState();
}

class _CreateLessonPageState
    extends ModularState<CreateLessonPage, CreateLessonController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomScaffold(
        title: 'Criar nova lição',
        body: RxBuilder(builder: (context) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: height * .01),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dados da Lição',
                    style: AppTypography.h1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width * .7,
                    child: AppInputText(
                      labelText: 'Título da Lição',
                      hintText: 'Ex.: Vogais',
                      onChanged: (value) {
                        controller.lessonTitle = value;
                        controller.enableButton();
                      },
                    ),
                  ),
                  Container(
                    width: width * .2,
                    child: AppInputText(
                      labelText: 'Nível',
                      hintText: 'Ex.: 1',
                      formatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        controller.lessonLevel = value;
                        controller.enableButton();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * .02,
                ),
                child: AppInputText(
                    labelText: 'Corpo da Lição',
                    hintText: 'Ex.: Pratique as vogais',
                    onChanged: (value) {
                      controller.lessonBody = value;
                      controller.enableButton();
                    }),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.lessonActivityCount,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * .01),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Atividade ${index + 1}',
                                  style: AppTypography.h2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * .01),
                              child: AppInputText(
                                labelText: 'Título',
                                hintText: 'Ex.: Vogal A',
                                onChanged: (value) {
                                  controller.activityList[index]['titulo'] =
                                      value;
                                  controller.enableButton();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * .01),
                              child: AppInputText(
                                labelText: 'Corpo',
                                hintText: 'Ex.: Pratique a vogal A',
                                onChanged: (value) {
                                  controller.activityList[index]['corpo'] =
                                      value;
                                  controller.enableButton();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * .01),
                              child: AppInputText(
                                labelText: 'Vídeo',
                                hintText: 'Url de um vídeo de exemplo',
                                onChanged: (value) {
                                  controller.activityList[index]['video'] =
                                      value;
                                  controller.enableButton();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: controller.lessonActivityCount > 1
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      controller.incrementActivityCount();
                      controller.activityList
                          .add({'titulo': '', 'corpo': '', 'video': ''});
                      controller.enableButton();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  controller.lessonActivityCount > 1
                      ? FloatingActionButton(
                          onPressed: () {
                            controller.decrementActivityCount();
                            controller.activityList.removeLast();
                            controller.enableButton();
                          },
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: AppColors.primary, width: 2)),
                          child: Icon(Icons.remove, color: AppColors.primary),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              AppFlatButton(
                  onPressed: controller.saveEnabled
                      ? () {
                          controller.createLessonJson();
                          if (controller.requestState.value ==
                              RequestState.SUCCESS) {
                            Navigator.of(context).popUntil((r) => r.isFirst);
                            SuccessNotification().call(
                                title: 'Sucesso',
                                subtitle: 'Lição nova criada com sucesso!');
                          } else {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) {
                                  return SimpleLoaderWidget(
                                    key: Key('createLoader'),
                                  );
                                });
                          }
                        }
                      : null,
                  text: 'Salvar')
            ],
          );
        }));
  }
}
