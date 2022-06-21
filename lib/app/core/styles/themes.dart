import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData appTheme({
    Color primaryColor: AppColors.primary,
    Color secondaryColor: AppColors.secondary,
    Color scaffoldBackgroundColor: const Color(0xffffffff),
  }) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return ThemeData(
      errorColor: AppColors.danger,
      primaryColor: primaryColor,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      highlightColor: Colors.white,
      primarySwatch: MaterialColor(primaryColor.value, {
        50: primaryColor.withOpacity(.1),
        100: primaryColor.withOpacity(.2),
        200: primaryColor.withOpacity(.3),
        300: primaryColor.withOpacity(.4),
        400: primaryColor.withOpacity(.5),
        500: primaryColor.withOpacity(.6),
        600: primaryColor.withOpacity(.7),
        700: primaryColor.withOpacity(.8),
        800: primaryColor.withOpacity(.9),
        900: primaryColor.withOpacity(1),
      }),
      colorScheme:
          ColorScheme.light(primary: primaryColor, secondary: secondaryColor),
      fontFamily: GoogleFonts.arimo().fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: primaryColor),
      ),
      disabledColor: primaryColor.withOpacity(0.4),
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        toolbarTextStyle: TextTheme().bodyText2,
        titleTextStyle: TextTheme().headline6,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16),
        bodyText2: TextStyle(fontSize: 16),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        height: 48,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
    );
  }
}
