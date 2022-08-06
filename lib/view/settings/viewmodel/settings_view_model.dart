// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../_product/_utility/decoration_helper.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late DecorationHelper helper;

  @observable
  Locale? appLocale = LanguageManager.instance.enLocale;

  @observable
  bool isLoading = false;

  @override
  void init() {
    helper = DecorationHelper(context: baseContext);
  }

  @action
  Future<void> changeAppTheme() async {
    baseContext.read<ThemeNotifier>().changeTheme();
  }

  @action
  Future<void> changeAppLocalization(Locale? locale) async {
    if (locale != null) {
      appLocale = locale;
      await baseContext.setLocale(locale);
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> navigateToOnBoard() async {
    changeLoading();
    await navigation.navigateToPage(path: NavigationConstants.ONBOARD_VIEW);
    changeLoading();
  }
}
