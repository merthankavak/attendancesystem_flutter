// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../_product/_widgets/dialog/resend_alert_dialog.dart';
import '../../model/forgot_password_model.dart';
import '../../service/IForgotPasswordService.dart';
import '../../service/forgot_password_service.dart';

part 'confirm_otp_view_model.g.dart';

class ConfirmOtpViewModel = _ConfirmOtpViewModelBase with _$ConfirmOtpViewModel;

abstract class _ConfirmOtpViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formStateConfirmOtp = GlobalKey();
  late IForgotPasswordService forgotPasswordService;
  TextEditingController? otpCodeController;
  FocusNode? focusNode;

  @observable
  String? currentText = '';

  @observable
  bool isLoading = false;

  @override
  void init() {
    forgotPasswordService = ForgotPasswordService(vexanaManager!.networkManager, scaffoldKey);
    focusNode = FocusNode();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchConfirmOtpCode(String otpCode, String typeOfUser) async {
    _changeLoading();
    if (formStateConfirmOtp.currentState!.validate()) {
      final response = await forgotPasswordService.confirmOtpCode(
          ForgotPasswordModel(otpCode: otpCode), typeOfUser);
      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.CHANGE_PASSWORD_VIEW, data: '$otpCode,$typeOfUser');
      }
    }
    _changeLoading();
  }

  @action
  Future<void> fetchResendOtpCodeToEmail(
      BuildContext context, String email, String typeOfUser) async {
    _changeLoading();

    final response = await forgotPasswordService.sendOtpCodeToEmail(
        ForgotPasswordModel(email: email), typeOfUser);
    if (response != null) {
      await alertDialog(context);
    }

    _changeLoading();
  }

  Future<void> sendToLoginView() async {
    _changeLoading();
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    _changeLoading();
  }

  Future<void> sendToForgotPasswordView() async {
    _changeLoading();
    await navigation.navigateToPageClear(path: NavigationConstants.FORGOT_PASSWORD_VIEW);
    _changeLoading();
  }

  Future<dynamic> alertDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return ResendAlertDialog(
          onPressed: () async {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
