import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class DecorationHelper {
  BuildContext? context;

  DecorationHelper({this.context});

  BoxDecoration get boxDecorationLeft => BoxDecoration(
        borderRadius: context!.normalCircularRadius,
        color: context!.colors.surface,
        boxShadow: [boxShadowLeft],
      );

  BoxDecoration get boxDecorationRight => BoxDecoration(
        borderRadius: context!.normalCircularRadius,
        color: context!.colors.surface,
        boxShadow: [boxShadowRight],
      );
  BoxDecoration get boxDecorationAll => BoxDecoration(
        borderRadius: context!.normalCircularRadius,
        color: context!.colors.surface,
        boxShadow: [boxShadowLeft, boxShadowRight, boxShadowUp],
      );

  BoxShadow get boxShadowLeft => BoxShadow(
      color: context!.colorSchemeLight.blackShadow,
      offset: const Offset(-3, 3),
      blurRadius: context!.normalBlur);

  BoxShadow get boxShadowRight => BoxShadow(
      color: context!.colorSchemeLight.blackShadow,
      offset: const Offset(3, 3),
      blurRadius: context!.normalBlur);

  BoxShadow get boxShadowUp => BoxShadow(
      color: context!.colorSchemeLight.black26,
      offset: const Offset(0.0, 0.0),
      blurRadius: context!.normalBlur);

  InputDecoration get outlineInputDecoration => InputDecoration(
        labelStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        ),
        helperStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: TextStyle(
          color: context!.colorSchemeLight.black,
          fontSize: null,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        ),
        errorStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        isDense: false,
        contentPadding: context!.paddingLow,
        isCollapsed: false,
        prefixStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        suffixStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        counterStyle: TextStyle(
          color: context!.colorSchemeLight.transparentBlack,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        filled: true,
        fillColor: context!.colorSchemeLight.white,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.red,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.blue,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.red,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.white,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.transparentBlack,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context!.colorSchemeLight.white,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
      );
}
