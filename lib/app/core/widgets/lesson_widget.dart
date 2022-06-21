import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../models/new_lesson.dart';
import '../styles/colors.dart';
import '../styles/typography.dart';
import 'notifications/warning_notification.dart';

class LessonWidget extends StatelessWidget {
  final NewLesson lesson;
  final String routeName;
  final bool lock;
  final Object? arguments;
  final Color color;
  const LessonWidget({
    Key? key,
    required this.lesson,
    required this.routeName,
    required this.lock,
    this.arguments,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // print(height);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            maximumSize: Size(170, 150),
            fixedSize: Size(width * .45, height * .4),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () => !this.lock
            ? WarningNotification().call(
                title: "Atenção",
                subtitle: 'Conclua a lição anterior para acessar esta lição!')
            : Modular.to.pushNamed(routeName, arguments: arguments),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  !this.lock
                      ? Icon(
                          Icons.lock_outline,
                          color: AppColors.black_56,
                        )
                      : Icon(
                          Icons.lock_open_rounded,
                          color: Color.fromARGB(255, 228, 227, 226),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lesson.titulo ?? 'LIÇÃO VAZIA',
                    style: AppTypography.h1.copyWith(
                        color: !this.lock
                            ? AppColors.black_56
                            : Color.fromARGB(255, 228, 227, 226),
                        fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                    textScaleFactor: height * 0.0011,
                  ),
                  SizedBox(
                    height: height * .008,
                  ),
                  Text(
                    lesson.corpo ?? '',
                    style: AppTypography.h2.copyWith(
                      color: !this.lock
                          ? AppColors.black_56
                          : Color.fromARGB(255, 228, 227, 226),
                    ),
                    textAlign: TextAlign.center,
                    textScaleFactor: width * 0.0021,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
