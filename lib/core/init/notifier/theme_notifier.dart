import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../../constants/enums/preferences_keys_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;
  bool _isDark = false;

  AppThemes get currenThemeEnum => _currenThemeEnum;
  ThemeData get currentTheme => _currentTheme;
  bool get isDark => _isDark;

  ThemeNotifier() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    var prefs = await SharedPreferences.getInstance();
    var preferredTheme = prefs.getBool(PreferencesKeys.THEME.toString()) ?? false;
    _currentTheme = preferredTheme ? ThemeData.dark() : AppThemeLight.instance.theme;
    _currenThemeEnum = preferredTheme ? AppThemes.DARK : AppThemes.LIGHT;
    notifyListeners();
  }

  Future<void> setSharedPrefs(bool isDark) async {
    var prefs = await SharedPreferences.getInstance();
    isDark
        ? await prefs.setBool(PreferencesKeys.THEME.toString(), true)
        : await prefs.setBool(PreferencesKeys.THEME.toString(), false);
    notifyListeners();
  }

  void changeTheme() async {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.DARK;
      _isDark = true;
      await setSharedPrefs(_isDark);
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.LIGHT;
      _isDark = false;
      await setSharedPrefs(_isDark);
    }
    notifyListeners();
  }
}
