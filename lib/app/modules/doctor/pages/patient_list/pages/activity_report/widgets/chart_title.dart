import 'package:flutter/material.dart';

import '../../../../../../../core/styles/typography.dart';

class ChartTitle extends StatelessWidget {
  String title = '';

  ChartTitle({
    Key? key,
    required String title,
  }) : super(key: key) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.h1,
      textAlign: TextAlign.center,
    );
  }
}
