import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../_product/_widgets/dialog/confirm_alert_dialog.dart';
import '../../model/forgot_password_model.dart';
import '../../service/IForgotPasswordService.dart';
import '../../service/forgot_password_service.dart';

part 'change_password_view_model.g.dart';

class ChangePasswordViewModel = _ChangePasswordViewModelBase with _$ChangePasswordViewModel;

abstract class _ChangePasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formStateChangePassword = GlobalKey();
  late IForgotPasswordService forgotPasswordService;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  @observable
  bool isLoading = false;

  @override
  void init() {
    forgotPasswordService = ForgotPasswordService(vexanaManager!.networkManager, scaffoldKey);
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchConfirmChangePassword(
      BuildContext context, String otpCode, String typeOfUser) async {
    _changeLoading();
    if (formStateChangePassword.currentState!.validate()) {
      final response = await forgotPasswordService.changePassword(
          ForgotPasswordModel(
              password: passwordController!.text, confirmPassword: confirmPasswordController!.text),
          otpCode.toString(),
          typeOfUser);
      if (response != null) {
        await alertDialog(context);
      }
    }
    _changeLoading();
  }

  Future<void> sendToLoginView() async {
    _changeLoading();
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    _changeLoading();
  }

  Future<dynamic> alertDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ConfirmAlertDialog(
          onPressed: () async {
            await sendToLoginView();
          },
        );
      },
    );
  }
}
