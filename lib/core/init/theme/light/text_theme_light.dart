import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 =
      TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final TextStyle headline4 =
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline5 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final TextStyle headline6 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  final TextStyle subtitle1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15);
  final TextStyle subtitle2 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);
  final TextStyle bodyText1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);
  final TextStyle bodyText2 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle button =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25);
  final TextStyle caption =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4);
  final TextStyle overline =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
