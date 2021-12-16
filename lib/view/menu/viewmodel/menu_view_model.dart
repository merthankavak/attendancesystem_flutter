import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../model/menu_model.dart';

part 'menu_view_model.g.dart';

class MenuViewModel = _MenuViewModelBase with _$MenuViewModel;

abstract class _MenuViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  List<MenuModel> menuItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  String typeOfUser = '';

  @computed
  String get typeOfUsers => typeOfUser;

  @override
  void init() {
    menuItems.add(MenuModel(
        LocaleKeys.course_title, Icon(FontAwesomeIcons.home), NavigationConstants.COURSE_VIEW));
    menuItems.add(MenuModel(LocaleKeys.profile_appbar, Icon(FontAwesomeIcons.userAlt),
        NavigationConstants.PROFILE_VIEW));
    menuItems.add(
      MenuModel(
          LocaleKeys.setting_title, Icon(FontAwesomeIcons.cog), NavigationConstants.SETTINGS_VIEW),
    );
  }

  @action
  Future<void> getToken() async {
    typeOfUser = await localeManager.getStringValue(PreferencesKeys.TYPEOFUSER).toString();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> changeIndex(int index) async {
    changeLoading();
    await localeManager.setIntegerValue(PreferencesKeys.INDEX, index);
    changeLoading();
  }

  @action
  Future<void> completeToMenu() async {
    changeLoading();
    currentIndex = await localeManager.getIntegerValue(PreferencesKeys.INDEX);
    await localeManager.setIntegerValue(PreferencesKeys.INDEX, 0);
    changeLoading();
  }

  @action
  Future<void> sendToPage(String path) async {
    changeLoading();
    await navigation.navigateToPage(path: path, data: typeOfUsers);
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
