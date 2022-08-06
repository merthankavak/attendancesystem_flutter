// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuViewModel on _MenuViewModelBase, Store {
  Computed<String>? _$typeOfUsersComputed;

  @override
  String get typeOfUsers =>
      (_$typeOfUsersComputed ??= Computed<String>(() => super.typeOfUsers,
              name: '_MenuViewModelBase.typeOfUsers'))
          .value;

  late final _$currentIndexAtom =
      Atom(name: '_MenuViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MenuViewModelBase.isLoading', context: context);

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

  late final _$typeOfUserAtom =
      Atom(name: '_MenuViewModelBase.typeOfUser', context: context);

  @override
  String get typeOfUser {
    _$typeOfUserAtom.reportRead();
    return super.typeOfUser;
  }

  @override
  set typeOfUser(String value) {
    _$typeOfUserAtom.reportWrite(value, super.typeOfUser, () {
      super.typeOfUser = value;
    });
  }

  late final _$changeIndexAsyncAction =
      AsyncAction('_MenuViewModelBase.changeIndex', context: context);

  @override
  Future<void> changeIndex(int index) {
    return _$changeIndexAsyncAction.run(() => super.changeIndex(index));
  }

  late final _$completeToMenuAsyncAction =
      AsyncAction('_MenuViewModelBase.completeToMenu', context: context);

  @override
  Future<void> completeToMenu() {
    return _$completeToMenuAsyncAction.run(() => super.completeToMenu());
  }

  late final _$sendToPageAsyncAction =
      AsyncAction('_MenuViewModelBase.sendToPage', context: context);

  @override
  Future<void> sendToPage(String path) {
    return _$sendToPageAsyncAction.run(() => super.sendToPage(path));
  }

  late final _$logutAppAsyncAction =
      AsyncAction('_MenuViewModelBase.logutApp', context: context);

  @override
  Future<void> logutApp() {
    return _$logutAppAsyncAction.run(() => super.logutApp());
  }

  late final _$_MenuViewModelBaseActionController =
      ActionController(name: '_MenuViewModelBase', context: context);

  @override
  void getToken() {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.getToken');
    try {
      return super.getToken();
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_MenuViewModelBaseActionController.startAction(
        name: '_MenuViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MenuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isLoading: ${isLoading},
typeOfUser: ${typeOfUser},
typeOfUsers: ${typeOfUsers}
    ''';
  }
}
