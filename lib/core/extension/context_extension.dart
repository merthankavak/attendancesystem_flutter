import 'dart:math';

import 'package:flutter/material.dart';

import '../init/theme/light/color_scheme_light.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get lowValue => height * .01;
  double get bitNormal => height * .015;
  double get normalValue => height * .02;
  double get mediumValue => height * .04;
  double get highValue => height * .1;
  double get veryhighValue => height * .2;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  ColorSchemeLight get colorSchemeLight => ColorSchemeLight.instance!;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingBitNormal => EdgeInsets.all(bitNormal);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingOnlyList =>
      EdgeInsets.only(left: normalValue, right: normalValue, top: normalValue, bottom: lowValue);
}

extension PaddingExtensionSymmetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
  EdgeInsets get paddingVeryHighHorizontal => EdgeInsets.symmetric(horizontal: veryhighValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(microseconds: 500);
  Duration get normalDuration => const Duration(microseconds: 1000);
  Duration get mediumDuration => const Duration(seconds: 1);
  Duration get highDuration => const Duration(seconds: 3);
}

extension BorderRadiusCircularExtension on BuildContext {
  BorderRadius get lowCircularRadius => BorderRadius.circular(5.0);
  BorderRadius get normalCircularRadius => BorderRadius.circular(10.0);
  BorderRadius get mediumCircularRadius => BorderRadius.circular(15.0);
  BorderRadius get highCircularRadius => BorderRadius.circular(30.0);
  BorderRadius get veryHighCircularRadius => BorderRadius.circular(60.0);
}

extension RadiusExtension on BuildContext {
  Radius get lowRadius => const Radius.circular(5.0);
  Radius get normalRadius => const Radius.circular(10.0);
  Radius get mediumRadius => const Radius.circular(15.0);
  Radius get highRadius => const Radius.circular(30.0);
  Radius get veryHighRadius => const Radius.circular(60.0);
}

extension BlurRadiusExtension on BuildContext {
  double get lowBlur => 1.0;
  double get normalBlur => 3.0;
  double get mediumBlur => 5.0;
  double get highBlur => 10.0;
}
