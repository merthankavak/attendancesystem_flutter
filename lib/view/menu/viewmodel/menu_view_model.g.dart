// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuViewModel on _MenuViewModelBase, Store {
  Computed<String>? _$typeOfUsersComputed;

  @override
  String get typeOfUsers =>
      (_$typeOfUsersComputed ??= Computed<String>(() => super.typeOfUsers,
              name: '_MenuViewModelBase.typeOfUsers'))
          .value;

  final _$currentIndexAtom = Atom(name: '_MenuViewModelBase.currentIndex');

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

  final _$isLoadingAtom = Atom(name: '_MenuViewModelBase.isLoading');

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

  final _$typeOfUserAtom = Atom(name: '_MenuViewModelBase.typeOfUser');

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

  final _$changeIndexAsyncAction =
      AsyncAction('_MenuViewModelBase.changeIndex');

  @override
  Future<void> changeIndex(int index) {
    return _$changeIndexAsyncAction.run(() => super.changeIndex(index));
  }

  final _$completeToMenuAsyncAction =
      AsyncAction('_MenuViewModelBase.completeToMenu');

  @override
  Future<void> completeToMenu() {
    return _$completeToMenuAsyncAction.run(() => super.completeToMenu());
  }

  final _$sendToPageAsyncAction = AsyncAction('_MenuViewModelBase.sendToPage');

  @override
  Future<void> sendToPage(String path) {
    return _$sendToPageAsyncAction.run(() => super.sendToPage(path));
  }

  final _$logutAppAsyncAction = AsyncAction('_MenuViewModelBase.logutApp');

  @override
  Future<void> logutApp() {
    return _$logutAppAsyncAction.run(() => super.logutApp());
  }

  final _$_MenuViewModelBaseActionController =
      ActionController(name: '_MenuViewModelBase');

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
