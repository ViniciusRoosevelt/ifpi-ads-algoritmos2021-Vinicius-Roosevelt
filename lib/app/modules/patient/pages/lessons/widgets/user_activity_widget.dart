import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/images/badge_premiun.dart';
import '../../../../../core/models/new_activity.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/patient_grade.dart';

class UserActivityWidget extends StatelessWidget {
  final NewActivity activity;
  final String score;
  final String routeName;
  final Object? arguments;

  const UserActivityWidget({
    Key? key,
    required this.score,
    required this.activity,
    required this.routeName,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () =>
          Navigator.pushNamed(context, routeName, arguments: arguments),
      style: userActivityWidgetStyle(width, height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            activity.titulo ?? '',
            style: AppTypography.h1,
            textScaleFactor: height * 0.002,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.string(
                badgePremiun,
                width: width * .06,
              ),
              PatientGrade(screenWidth: width * .55, value: double.parse(score)),
            ],
          )
        ],
      ),
    );
  }

  userActivityWidgetStyle(double width, double height) =>
      ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
}
