import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

static const MaterialColor secondary = const MaterialColor(
  0xFF051C3F,
  const <int, Color>{
    50: const Color.fromRGBO(53,53,83, 0.1),
    100: const Color.fromRGBO(53,53,83, 0.2),
    200: const Color.fromRGBO(53,53,83, 0.3),
    300: const Color.fromRGBO(53,53,83, 0.4),
    400: const Color.fromRGBO(53,53,83, 0.5),
    500: const Color.fromRGBO(53,53,83, 0.6),
    600: const Color.fromRGBO(53,53,83, 0.7),
    700: const Color.fromRGBO(53,53,83, 0.8),
    800: const Color.fromRGBO(53,53,83, 0.9),
    900: const Color.fromRGBO(53,53,83, 1),
  },
);

  static const Color transparent = Color(0x00);
  static const Color transparentBtn = Color.fromRGBO(0, 0, 0, .15);
  static const Color green = Color(0xFF3AB74E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF01414);
  static const Color purple = Color(0xFF353553);
  static const Color darkGrey = Color(0xFF656F78);
  static const Color grey = Color.fromRGBO(109, 109, 109, .06);
}
