import 'package:flutter/material.dart';

import '../../../../../core/styles/typography.dart';

class NoPatientText extends StatelessWidget {
  const NoPatientText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Você ainda não tem pacientes!',
      style: AppTypography.h2,
    ));
  }
}
