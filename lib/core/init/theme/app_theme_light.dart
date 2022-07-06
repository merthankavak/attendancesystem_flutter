import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with LightThemeInterface {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        appBarTheme: appBarTheme,
        colorScheme: _appColorScheme,
        textTheme: textTheme,
        tabBarTheme: tabBarTheme,
        dialogTheme: dialogTheme,
        buttonTheme: buttonTheme,
        inputDecorationTheme: inputTheme,
        chipTheme: chipTheme,
        sliderTheme: sliderTheme,
        dividerColor: colorSchemeLight!.white,
        scaffoldBackgroundColor: colorSchemeLight!.lightGray,
        canvasColor: colorSchemeLight!.lightGray,
        errorColor: colorSchemeLight!.red,
        hintColor: colorSchemeLight!.black,
        indicatorColor: colorSchemeLight!.lightBlue,
        dialogBackgroundColor: colorSchemeLight!.white,
        backgroundColor: colorSchemeLight!.lightBlue,
        disabledColor: colorSchemeLight!.black,
        cardColor: colorSchemeLight!.white,
        primaryColor: colorSchemeLight!.lightBlue,
        primarySwatch: Colors.lightBlue,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        floatingActionButtonTheme: floatingActionButtonTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: _appColorScheme.primary, width: 3),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline6,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.5),
      unselectedLabelStyle: textThemeLight!.headline6,
    );
  }

  DialogTheme get dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorSchemeLight!.white, width: 0, style: BorderStyle.none),
        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
      ),
    );
  }

  InputDecorationTheme get inputTheme {
    return InputDecorationTheme(
      labelStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      helperStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: colorSchemeLight!.black,
        fontSize: null,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorMaxLines: null,
      isDense: false,
      contentPadding: insets.lowPaddingAll,
      isCollapsed: false,
      prefixStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      suffixStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      counterStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      filled: true,
      fillColor: colorSchemeLight!.white,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.red,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.blue,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.red,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.white,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.lightBlue,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight!.white,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  ButtonThemeData get buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: insets.lowPaddingAll,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorSchemeLight!.transparent,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false,
      buttonColor: colorSchemeLight!.blue,
      disabledColor: colorSchemeLight!.black,
      highlightColor: colorSchemeLight!.blue,
      splashColor: colorSchemeLight!.darkBlue,
      focusColor: colorSchemeLight!.black,
      hoverColor: colorSchemeLight!.black12,
    );
  }

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: colorSchemeLight!.blue,
        onSurface: colorSchemeLight!.white,
        backgroundColor: colorSchemeLight!.blue,
        padding: insets.lowPaddingAll,
        shadowColor: colorSchemeLight!.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorSchemeLight!.black12,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: colorSchemeLight!.blue, // Button Bg Color
        onPrimary: colorSchemeLight!.white, // Button text Color
        onSurface: colorSchemeLight!.black,
        shadowColor: colorSchemeLight!.black,
        padding: insets.mediumPaddingAll,
        alignment: Alignment.center,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
    );
  }

  OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: colorSchemeLight!.blue,
        onSurface: colorSchemeLight!.white,
        backgroundColor: colorSchemeLight!.blue,
        shadowColor: colorSchemeLight!.black,
        padding: insets.mediumPaddingAll,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorSchemeLight!.black12,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
    );
  }

  FloatingActionButtonThemeData get floatingActionButtonTheme {
    return FloatingActionButtonThemeData(
      foregroundColor: colorSchemeLight!.black,
      backgroundColor: colorSchemeLight!.blue,
      focusColor: colorSchemeLight!.black,
      hoverColor: colorSchemeLight!.black12,
      splashColor: colorSchemeLight!.darkBlue,
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      systemOverlayStyle: colorSchemeLight!.systemUiOverlayLight,
      color: colorSchemeLight!.lightGray,
      backgroundColor: null,
      foregroundColor: null,
      elevation: 0,
      toolbarHeight: 85,
      shadowColor: colorSchemeLight!.black,
      iconTheme: IconThemeData(
        color: colorSchemeLight!.black,
      ),
      actionsIconTheme: IconThemeData(color: colorSchemeLight!.black),
      centerTitle: true,
      toolbarTextStyle: textTheme.headline6!.copyWith(color: colorSchemeLight!.black),
      titleTextStyle: textTheme.headline6!.copyWith(color: colorSchemeLight!.black),
    );
  }

  SliderThemeData get sliderTheme {
    return SliderThemeData(
      activeTrackColor: null,
      inactiveTrackColor: null,
      disabledActiveTrackColor: null,
      disabledInactiveTrackColor: null,
      activeTickMarkColor: null,
      inactiveTickMarkColor: null,
      disabledActiveTickMarkColor: null,
      disabledInactiveTickMarkColor: null,
      thumbColor: null,
      disabledThumbColor: null,
      thumbShape: null,
      overlayColor: null,
      valueIndicatorColor: null,
      valueIndicatorShape: null,
      showValueIndicator: null,
      valueIndicatorTextStyle: TextStyle(
        color: colorSchemeLight!.white,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  ChipThemeData get chipTheme {
    return ChipThemeData(
      backgroundColor: colorSchemeLight!.lightBlue,
      brightness: colorSchemeLight!.brightnessLight,
      deleteIconColor: colorSchemeLight!.transparentBlack,
      disabledColor: colorSchemeLight!.black,
      labelPadding: insets.normalPaddingAll,
      labelStyle: TextStyle(
        color: colorSchemeLight!.transparentBlack,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: insets.lowPaddingAll,
      secondaryLabelStyle: TextStyle(
        color: colorSchemeLight!.black,
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: colorSchemeLight!.lightBlue,
      selectedColor: colorSchemeLight!.black,
      shape: StadiumBorder(
          side: BorderSide(
        color: colorSchemeLight!.black,
        width: 0,
        style: BorderStyle.none,
      )),
    );
  }

  TextTheme get textTheme {
    return TextTheme(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        headline3: textThemeLight!.headline3,
        headline4: textThemeLight!.headline4,
        headline5: textThemeLight!.headline5,
        headline6: textThemeLight!.headline6,
        subtitle1: textThemeLight!.subtitle1,
        subtitle2: textThemeLight!.subtitle2,
        bodyText1: textThemeLight!.bodyText1,
        bodyText2: textThemeLight!.bodyText2,
        button: textThemeLight!.button,
        caption: textThemeLight!.caption,
        overline: textThemeLight!.overline);
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.blue, //xx
        primaryContainer: colorSchemeLight!.white, //xx
        secondary: colorSchemeLight!.darkBlue, //xx
        secondaryContainer: colorSchemeLight!.lightBlue,
        surface: colorSchemeLight!.white, //xx
        background: colorSchemeLight!.lightBlue, //xx
        error: colorSchemeLight!.red, //xx
        onPrimary: colorSchemeLight!.blue,
        onSecondary: colorSchemeLight!.black, //xx
        onSurface: colorSchemeLight!.lightGray, //xx
        onBackground: colorSchemeLight!.gray,
        onError: colorSchemeLight!.orange, //xx
        brightness: colorSchemeLight!.brightnessLight);
  }
}
