// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_utility/decoration_helper.dart';
import '../../course/model/submodel/students/student_model.dart';
import '../../course/model/submodel/teacher/teacher_model.dart';
import '../model/student_profile_response_model.dart';
import '../model/teacher_profile_response_model.dart';
import '../service/IProfileService.dart';
import '../service/profile_service.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  GlobalKey<ScaffoldState> profileScaffoldKey = GlobalKey();
  GlobalKey<FormState> profileStudentChangeUsernameFormKey = GlobalKey();
  GlobalKey<FormState> profileTeacherChangeUsernameFormKey = GlobalKey();
  GlobalKey<FormState> profileStudentChangePasswordFormKey = GlobalKey();
  GlobalKey<FormState> profileTeacherChangePasswordFormKey = GlobalKey();

  late IProfileService profileService;
  late DecorationHelper helper;

  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? fullNameController;

  String? id = '';
  String? token = '';

  @observable
  bool isLoading = false;

  @observable
  StudentProfileResponseModel? studentProfileResponseModel;

  @observable
  TeacherProfileResponseModel? teacherProfileResponseModel;

  @computed
  TeacherModel? get teacherModel => teacherProfileResponseModel!.teacher;

  @computed
  StudentModel? get studentModel => studentProfileResponseModel!.student;

  @override
  void init() {
    helper = DecorationHelper(context: baseContext);
    profileService = ProfileService(vexanaManager!.networkManager, profileScaffoldKey);
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    fullNameController = TextEditingController();
    getPrefs();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getPrefs() async {
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    id = localeManager.getStringValue(PreferencesKeys.ID);
  }

  @action
  Future<void> changePassword(BuildContext context, String typeOfUser) async {
    changeLoading();

    if (typeOfUser == 'student') {
      if (profileStudentChangePasswordFormKey.currentState!.validate()) {
        if (navigation.navigatorKey.currentState!.canPop()) {
          navigation.navigatorKey.currentState!.pop();
        }
        final response =
            await profileService.updateStudentPassword(passwordController!.text, token!, id!);
        if (response != null) {
          await navigation.navigateToPageClear(
              path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
        }
      }
    }
    if (typeOfUser == 'teacher') {
      if (profileTeacherChangePasswordFormKey.currentState!.validate()) {
        if (navigation.navigatorKey.currentState!.canPop()) {
          navigation.navigatorKey.currentState!.pop();
        }
        final response =
            await profileService.updateTeacherPassword(passwordController!.text, token!, id!);
        if (response != null) {
          await navigation.navigateToPageClear(
              path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
        }
      }
    }
    changeLoading();
  }

  @action
  Future<void> updateStudentProfilePicture(String typeOfUser, Media file) async {
    changeLoading();

    var imageFile = File(file.path!);
    await profileService.updateStudentProfilePhoto(imageFile, token!, id!);
    await navigation.navigateToPage(path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
    changeLoading();
  }

  @action
  Future<void> updateStudentFullName(String typeOfUser) async {
    changeLoading();

    if (profileStudentChangeUsernameFormKey.currentState!.validate()) {
      if (navigation.navigatorKey.currentState!.canPop()) {
        navigation.navigatorKey.currentState!.pop();
      }
      final response =
          await profileService.updateStudentFullName(fullNameController!.text, token!, id!);
      if (response != null) {
        await navigation.navigateToPage(path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
      }
    }
    changeLoading();
  }

  @action
  Future<void> updateTeacherFullName(String typeOfUser) async {
    changeLoading();

    if (profileTeacherChangeUsernameFormKey.currentState!.validate()) {
      if (navigation.navigatorKey.currentState!.canPop()) {
        navigation.navigatorKey.currentState!.pop();
      }
      final response =
          await profileService.updateTeacherFullName(fullNameController!.text, token!, id!);
      if (response != null) {
        await navigation.navigateToPage(path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
      }
    }
    changeLoading();
  }

  @action
  Future<void> getUserInformation(String typeOfUser) async {
    changeLoading();
    if (typeOfUser == 'student') {
      studentProfileResponseModel = await profileService.showStudentInfo(token!, id!);
    }
    if (typeOfUser == 'teacher') {
      teacherProfileResponseModel = await profileService.showTeacherInfo(token!, id!);
    }
    changeLoading();
  }

  @action
  Future<void> logutApp() async {
    changeLoading();
    await localeManager.clearAllSaveFirst();
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    changeLoading();
  }
}
