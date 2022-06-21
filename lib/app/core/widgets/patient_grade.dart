import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../styles/colors.dart';

class PatientGrade extends StatelessWidget {
  final double screenWidth;
  final double value;
  final Color? color;
  final IconData? icon;
  final IconData? iconHalf;
  final IconData? iconEmpty;
  final bool ignoreGestures;

  const PatientGrade(
      {Key? key,
      required this.screenWidth,
      required this.value,
      this.color,
      this.icon,
      this.iconHalf,
      this.iconEmpty,
      this.ignoreGestures = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: _calculateValue(value),
      itemBuilder: (context, index) => Icon(
        icon ?? Icons.star,
        color: color ?? AppColors.warningDark,
      ),
      itemCount: 5,
      itemSize: screenWidth * .08,
      unratedColor: color?.withAlpha(50) ?? AppColors.warningDark.withAlpha(50),
      direction: Axis.horizontal,
    );
  }

  _calculateValue(double value) {
    return (value / 200) * 10;
  }
}
