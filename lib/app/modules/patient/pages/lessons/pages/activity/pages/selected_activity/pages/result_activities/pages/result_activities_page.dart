import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import '../../../../../../../../../../../core/images/pet.dart';
import '../../../../../../../../../../../core/models/new_activity.dart';
import '../../../../../../../../../../../core/styles/colors.dart';
import '../../../../../../../../../../../core/styles/typography.dart';
import '../../../../../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../../../../../core/widgets/patient_grade.dart';
import '../result_activities_controller.dart';

class ResultActivitiesPage extends StatefulWidget {
  const ResultActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ResultActivitiesPage> createState() => _ResultActivitiesPageState();
}

class _ResultActivitiesPageState
    extends ModularState<ResultActivitiesPage, ResultActivitiesController> {
  NewActivity userActivity = Modular.args.data[0][0];
  String idLesson = Modular.args.data[0][1];
  String idActivity = Modular.args.data[0][2];
  String scoreData = Modular.args.data[1];
  late int numer;
  late bool pass;

  void initState() {
    super.initState();
    numer = Random().nextInt(100);
    print('Score Data: $scoreData');
    print(Modular.args.data[0][3]);
    // controller.send_pontuaction2(
    //     scoreData, idLesson, idActivity, Modular.args.data[0][3], storagePath);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      title: '${userActivity.titulo}',
      body: _body(width, height),
      height: height * .75,
    );
  }

  _body(double width, double height) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(scoreData.toString()),
            SizedBox(
              width: width,
              height: height * 0.27,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: SizedBox(
                      height: height * .1,
                      width: width * 0.5,
                      child: Text(
                        _calc_text(double.parse(scoreData)),
                        textScaleFactor: height * 0.0014,
                        style: AppTypography.body,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    bottom: height * 0.10,
                    right: width * .16,
                  ),
                  Positioned(
                    child: SvgPicture.string(
                      pet,
                      height: height * .2,
                      width: width * 0.8,
                    ),
                    //bottom: 30,
                    // left: width * 0.07,
                    // bottom: height * .04,
                  ),
                ],
              ),
            ),
            Container(
                child: PatientGrade(
                    screenWidth: width * 1.2, value: double.parse(scoreData))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height / 25),
              child: _pass(height, width),
            )
          ],
        ),
      ),
    );
  }

  _button(Color color, String title, VoidCallback onPressed, double height,
          double widght) =>
      OutlinedButton(
        onPressed: onPressed,
        child: Text(
          title,
          textScaleFactor: height * 0.0015,
          style: AppTypography.button.copyWith(color: color),
        ),
        style: OutlinedButton.styleFrom(
            fixedSize: Size(height / 5.5, widght / 10),
            side: BorderSide(color: color, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32))),
      );
  _calc_text(double num) {
    if (num >= 60) {
      pass = true;
      return "Parabens!\nVocê Conluiu a Atividade.Continue Assim.";
    } else {
      pass = false;
      return "Infelizmente,você nao concluiu a Atividade. Tente Novamente!";
    }
  }

  _pass(double height, double width) {
    if (pass == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _button(AppColors.primary, 'Anterior',
                  () => Navigator.pop(context), height, width),
              SizedBox(
                width: 10,
              ),
              _button(
                  AppColors.danger,
                  'Proxima',
                  () => [Navigator.pop(context), Navigator.pop(context)],
                  height,
                  width),
            ],
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _button(AppColors.warning, 'Refazer', () => Navigator.pop(context),
              height, width),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _button(AppColors.primary, 'Anterior',
                  () => Navigator.pop(context), height, width),
              SizedBox(
                width: 10,
              ),
              _button(
                  AppColors.danger,
                  'Proxima',
                  () => [Navigator.pop(context), Navigator.pop(context)],
                  height,
                  width),
            ],
          ),
        ],
      );
    }
  }
}
