import 'package:flutter/material.dart';

import '../../../../../core/styles/typography.dart';

class PatientListTitle extends StatelessWidget {
  const PatientListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width * .05, top: height * .02, bottom: height * .02),
      child: Text('Seus pacientes:',
          style: AppTypography.hx, textAlign: TextAlign.justify),
    );
  }
}
