import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../model/forgot_password_model.dart';
import '../service/IForgotPasswordService.dart';
import '../service/forgot_password_service.dart';

part 'forgot_password_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ForgotPasswordViewModel = _ForgotPasswordViewModelBase with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey<FormState> formStateSendOtpToMail = GlobalKey();

  late IForgotPasswordService forgotPasswordService;

  TextEditingController? emailController;

  @observable
  bool isLoading = false;

  @override
  void init() {
    forgotPasswordService = ForgotPasswordService(vexanaManager!.networkManager, scaffoldKey);
    emailController = TextEditingController();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchSendOtpCodeToEmail(String typeOfUser) async {
    _changeLoading();
    if (formStateSendOtpToMail.currentState!.validate()) {
      final response = await forgotPasswordService.sendOtpCodeToEmail(
          ForgotPasswordModel(email: emailController!.text), typeOfUser);
      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.CONFIRM_OTP_VIEW,
            data: '${emailController!.text},$typeOfUser');
      }
    }
    _changeLoading();
  }

  Future<void> sendToLoginView() async {
    _changeLoading();
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    _changeLoading();
  }
}
