import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // ====================================================
  // Base colors
  // ====================================================

  static const primary = const Color(0xFF52A3D0);
  static const primaryLight = const Color(0xFF7DBADC);
  static const primaryDark = const Color(0xFF3E7A9C);
  static final primary_04 = primary.withOpacity(.04);

  static const secondary = const Color(0xFFD07F52);
  static const secondaryLight = const Color(0xFFDC9F7D);
  static const secondaryDark = const Color(0xFF9C5F3E);
  static final secondary_04 = secondary.withOpacity(.04);

  static const terciary = const Color(0xFFBE52D0);
  static const terciaryLight = const Color(0xFFCE7DDC);
  static const terciaryDark = const Color(0xFF8F3E9C);
  static final terciary_04 = terciary.withOpacity(.04);

  static const quarternary = const Color(0xFF64D052);
  static const quarternaryLight = const Color(0xFF8BDC7D);
  static const quarternaryDark = const Color(0xFF4B9C3E);
  static final quarternary_04 = quarternary.withOpacity(.04);

  static final card_background = const Color(0xFFF5F5F5);

  // ====================================================
  // Alerts
  // ====================================================
  static const infoLight = const Color(0xFF009AEB);
  static const info = const Color(0xFF008AD2);
  static const infoDark = const Color(0xFF0079B8);

  static const successLight = const Color(0xFF40CF54);
  static const success = const Color(0xFF38B449);
  static const successDark = const Color(0xFF309C3F);
  static final success_04 = success.withOpacity(.04);

  static const warningLight = const Color(0xFFFFE064);
  static const warning = const Color(0xFFFFC73E);
  static const warningDark = const Color(0xFFE5B338);

  static const dangerLight = const Color(0xFFFF584C);
  static const danger = const Color(0xFFF44336);
  static const dangerDark = const Color(0xFFDB3C31);
  static final danger_04 = danger.withOpacity(.04);

  static const black = Color(0xFF000000);
  static final black_88 = black.withOpacity(.88);
  static final black_56 = black.withOpacity(.56);
  static final black_40 = black.withOpacity(.40);
  static final black_16 = black.withOpacity(.16);
  static final black_04 = black.withOpacity(.04);
}
