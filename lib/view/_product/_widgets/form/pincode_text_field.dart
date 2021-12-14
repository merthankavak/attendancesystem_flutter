import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../authenticate/forgot_password/viewmodel/subviewmodel/confirm_otp_view_model.dart';

class OtpPinCodeTextField extends StatelessWidget {
  final ConfirmOtpViewModel viewModel;
  const OtpPinCodeTextField({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPinCodeTextField(context);
  }

  PinCodeTextField buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      validator: (value) => value!.isValidOtps ? null : 'Code does not valid',
      pinTheme: buildPinCodeTheme(context),
      cursorColor: context.theme.colorScheme.onSecondary,
      animationDuration: Duration(milliseconds: 300),
      textStyle: context.textTheme.headline6,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      enableActiveFill: true,
      controller: viewModel.otpCodeController,
      errorTextSpace: 40,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        print(value);
        viewModel.currentText = value;
      },
      beforeTextPaste: (text) {
        return false;
      },
    );
  }

  PinTheme buildPinCodeTheme(BuildContext context) {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      selectedColor: context.theme.colorScheme.primaryVariant,
      inactiveColor: context.theme.colorScheme.secondary,
      activeFillColor: context.theme.colorScheme.primaryVariant,
      inactiveFillColor: context.theme.colorScheme.primaryVariant,
    );
  }
}
