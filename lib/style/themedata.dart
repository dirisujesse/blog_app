
import 'package:flutter/material.dart';
import 'package:blog/style/colors.dart';
import 'package:blog/style/style.dart';

class AppThemes {
  static final base = ThemeData.light();
  static final ThemeData defaultTheme = base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.primary,
    accentColor: AppColors.secondary,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColors.black,
        ),
      ),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: AppColors.black),
      color: AppColors.white,
      elevation: 0,
    ),
    dividerColor: AppColors.black.withOpacity(.3),
    bottomAppBarColor: AppColors.purple,
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: AppColors.purple,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      buttonColor: AppColors.purple,
      disabledColor: AppColors.purple.withOpacity(.5),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: AppColors.purple,
      foregroundColor: Colors.white,
    ),
    cardColor: AppColors.white,
    textSelectionColor: AppColors.purple.withOpacity(.3),
    errorColor: AppColors.red,
    textTheme: base.textTheme.apply(
      displayColor: AppColors.black,
      bodyColor: AppColors.black,
      fontFamily: AppFonts.bellota,
    ),
    dialogTheme: base.dialogTheme.copyWith(),
    indicatorColor: AppColors.purple,
    textSelectionHandleColor: AppColors.purple,
    cursorColor: AppColors.purple,
    iconTheme: base.iconTheme.copyWith(
      color: AppColors.black,
      size: 30,
    ),
  );
}
