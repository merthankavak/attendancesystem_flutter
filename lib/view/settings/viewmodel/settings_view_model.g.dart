// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  final _$appLocaleAtom = Atom(name: '_SettingsViewModelBase.appLocale');

  @override
  Locale? get appLocale {
    _$appLocaleAtom.reportRead();
    return super.appLocale;
  }

  @override
  set appLocale(Locale? value) {
    _$appLocaleAtom.reportWrite(value, super.appLocale, () {
      super.appLocale = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SettingsViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$changeAppThemeAsyncAction =
      AsyncAction('_SettingsViewModelBase.changeAppTheme');

  @override
  Future<void> changeAppTheme() {
    return _$changeAppThemeAsyncAction.run(() => super.changeAppTheme());
  }

  final _$changeAppLocalizationAsyncAction =
      AsyncAction('_SettingsViewModelBase.changeAppLocalization');

  @override
  Future<void> changeAppLocalization(Locale? locale) {
    return _$changeAppLocalizationAsyncAction
        .run(() => super.changeAppLocalization(locale));
  }

  final _$_SettingsViewModelBaseActionController =
      ActionController(name: '_SettingsViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appLocale: ${appLocale},
isLoading: ${isLoading}
    ''';
  }
}
