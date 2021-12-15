import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import 'device_and_cache.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => this.context = context;

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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> getToken() async {
    isFirstOpen = await localeManager.getBoolValue(PreferencesKeys.IS_FIRST_OPEN).toString();
    token = await localeManager.getStringValue(PreferencesKeys.TOKEN);
    typeOfUser = await localeManager.getStringValue(PreferencesKeys.TYPEOFUSER);
  }

  Future<void> controlAppState() async {
    await deviceandCacheInit();
    await getToken();
    await checkIsFirstOpen();
    print('Token is ' + token!);
  }

  Future<void> startAnimationOnView() async {
    if (context == null) return;
    await Future.delayed(context!.durationLow);
    _changeFirstInit();
  }

  Future<void> checkIsFirstOpen() async {
    if (isFirstOpen == 'false') {
      await Future.delayed(Duration(seconds: 1)).then((value) {
        navigation.navigateToPageClear(path: NavigationConstants.ONBOARD_VIEW);
      });
    } else {
      if (token == '') {
        await Future.delayed(Duration(seconds: 1)).then((value) {
          navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
        });
      } else {
        await Future.delayed(Duration(seconds: 1)).then((value) {
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
