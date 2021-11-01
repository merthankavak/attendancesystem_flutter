import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();
  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle.light;

  final Color veryLightBlue = Color(0xffF2F6F8);
  final Color lightBlue = Color(0xff6184D8);
  final Color blue = Color(0xff0055FF);
  final Color darkBlue = Color(0xff153678);

  final Color white = Color(0xffffffff);

  final Color lightGray = Color(0xfff1f3f8);

  final Color gray = Color(0xffa5a6ae);
  final Color darkGray = Color(0xff676870);

  final Color black = Color(0xff020306);
  final Color black12 = Color(0x1f000000);

  final Color red = Color(0xffc70137);
  final Color darkRed = Color(0x80c70137);

  final Color lightGreen = Color(0xff00C569);
  final Color forestGreen = Color(0xff228B22);
  final Color green = Color(0xff008000);
  final Color darkGreen = Color(0xff1B512D);

  final Color transparent = Color(0xAAffffff);
  final Color transparentBlack = Color(0xde000000);

  final Color orange = Colors.orange;
  final Color yellow = Color(0xFFcbd90a);
  final Color blackShadow = Color(0x3d000000);
  final Color black26 = Colors.black26;
}
