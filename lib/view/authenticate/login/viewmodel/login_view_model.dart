// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_widgets/dialog/verify_dialog.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey<FormState> formStateTeacherLogin = GlobalKey();
  GlobalKey<FormState> formStateTeacherRegister = GlobalKey();

  GlobalKey<FormState> formStateStudentLogin = GlobalKey();
  GlobalKey<FormState> formStateStudentRegister = GlobalKey();

  late ILoginService loginService;

  TextEditingController? studentEmailController;
  TextEditingController? teacherEmailController;
  TextEditingController? studentNameController;
  TextEditingController? teacherNameController;
  TextEditingController? studentPasswordController;
  TextEditingController? teacherPasswordController;

  @override
  void init() {
    loginService = LoginService(vexanaManager!.networkManager, scaffoldKey);
    studentEmailController = TextEditingController();
    teacherEmailController = TextEditingController();
    studentPasswordController = TextEditingController();
    teacherPasswordController = TextEditingController();
    studentNameController = TextEditingController();
    teacherNameController = TextEditingController();
  }

  @observable
  bool isRegister = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLock = true;

  @action
  Future<void> fetchLoginSevice(String typeOfUser) async {
    isLoadingChange();
    if (typeOfUser == 'student') {
      if (formStateStudentLogin.currentState!.validate()) {
        final response = await loginService.fetchLoginControl(
            LoginModel(
                email: studentEmailController!.text, password: studentPasswordController!.text),
            typeOfUser);
        if (response != null) {
          await localeManager.setStringValue(PreferencesKeys.TYPEOFUSER, typeOfUser);
          await localeManager.setStringValue(PreferencesKeys.TOKEN, response.token!);
          await localeManager.setStringValue(PreferencesKeys.ID, response.user!.id!);
          await localeManager.setStringValue(PreferencesKeys.EMAIL, response.user!.email!);
          await navigation.navigateToPage(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
        }
      }
    } else {
      if (formStateTeacherLogin.currentState!.validate()) {
        final response = await loginService.fetchLoginControl(
            LoginModel(
                email: teacherEmailController!.text, password: teacherPasswordController!.text),
            typeOfUser);

        if (response != null) {
          await localeManager.setStringValue(PreferencesKeys.TYPEOFUSER, typeOfUser);
          await localeManager.setStringValue(PreferencesKeys.TOKEN, response.token!);
          await localeManager.setStringValue(PreferencesKeys.ID, response.user!.id!);
          await localeManager.setStringValue(PreferencesKeys.EMAIL, response.user!.email!);
          await navigation.navigateToPage(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
        }
      }
    }
    isLoadingChange();
  }

  @action
  Future<void> fetchRegisterService(BuildContext context, String typeOfUser) async {
    isLoadingChange();
    if (typeOfUser == 'student') {
      if (formStateStudentRegister.currentState!.validate()) {
        final response = await loginService.fetchRegisterControl(
            LoginModel(
                email: studentEmailController!.text,
                fullName: studentNameController!.text,
                password: studentPasswordController!.text),
            typeOfUser);
        if (response != null) {
          await alertDialog(context);
        }
      }
    } else {
      if (formStateTeacherRegister.currentState!.validate()) {
        final response = await loginService.fetchRegisterControl(
            LoginModel(
                email: teacherEmailController!.text,
                fullName: teacherNameController!.text,
                password: teacherPasswordController!.text),
            typeOfUser);
        if (response != null) {
          await alertDialog(context);
        }
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isRegisterChange() {
    isRegister = !isRegister;
  }

  @action
  void isLockStateChange() {
    isLock = !isLock;
  }

  Future<void> sendToForgotPasswordView(String typeOfUser) async {
    isLoadingChange();
    await navigation.navigateToPageClear(
        path: NavigationConstants.FORGOT_PASSWORD_VIEW, data: typeOfUser);
    isLoadingChange();
  }

  Future<void> navigateToTerms() async {
    await navigation.navigateToPage(
      path: NavigationConstants.SETTINGS_WEB_VIEW,
    );
  }

  Future<void> sendToLoginView() async {
    isLoadingChange();
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    isLoadingChange();
  }

  Future<dynamic> alertDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return VerifyDialog(onPressed: () async {
          await sendToLoginView();
        });
      },
    );
  }
}
