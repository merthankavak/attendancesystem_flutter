// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import 'device_and_cache.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  String? token;

  @observable
  String? typeOfUser;

  @observable
  String? isFirstOpen;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> getToken() async {
    isFirstOpen = localeManager.getBoolValue(PreferencesKeys.IS_FIRST_OPEN).toString();
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    typeOfUser = localeManager.getStringValue(PreferencesKeys.TYPEOFUSER);
  }

  Future<void> controlAppState() async {
    await deviceandCacheInit();
    await getToken();
    await checkIsFirstOpen();
  }

  Future<void> startAnimationOnView() async {
    await Future.delayed(baseContext.durationLow);
    _changeFirstInit();
  }

  Future<void> checkIsFirstOpen() async {
    if (isFirstOpen == 'false') {
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        navigation.navigateToPageClear(path: NavigationConstants.ONBOARD_VIEW);
      });
    } else {
      if (token == '') {
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
        });
      } else {
        await Future.delayed(const Duration(seconds: 1)).then((value) {
          navigation.navigateToPageClear(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
        });
      }
    }
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}
