import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

class AppFonts {
  ///
  /// FONT-FAMILY BELLOTA
  ///
  static const bellota = "Bellota";
}

class AppTextStyle {

  static const TextStyle light = TextStyle(
    fontSize: 30,
    fontFamily: AppFonts.bellota,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 35,
    fontFamily: AppFonts.bellota,
  );

  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 40,
    fontFamily: AppFonts.bellota,
  );

  static final TextStyle black = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 40,
    fontFamily: AppFonts.bellota,
  );
}
