// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isRegisterAtom = Atom(name: '_LoginViewModelBase.isRegister');

  @override
  bool get isRegister {
    _$isRegisterAtom.reportRead();
    return super.isRegister;
  }

  @override
  set isRegister(bool value) {
    _$isRegisterAtom.reportWrite(value, super.isRegister, () {
      super.isRegister = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

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

  final _$isLockAtom = Atom(name: '_LoginViewModelBase.isLock');

  @override
  bool get isLock {
    _$isLockAtom.reportRead();
    return super.isLock;
  }

  @override
  set isLock(bool value) {
    _$isLockAtom.reportWrite(value, super.isLock, () {
      super.isLock = value;
    });
  }

  final _$fetchLoginSeviceAsyncAction =
      AsyncAction('_LoginViewModelBase.fetchLoginSevice');

  @override
  Future<void> fetchLoginSevice(String typeOfUser) {
    return _$fetchLoginSeviceAsyncAction
        .run(() => super.fetchLoginSevice(typeOfUser));
  }

  final _$fetchRegisterServiceAsyncAction =
      AsyncAction('_LoginViewModelBase.fetchRegisterService');

  @override
  Future<void> fetchRegisterService(BuildContext context, String typeOfUser) {
    return _$fetchRegisterServiceAsyncAction
        .run(() => super.fetchRegisterService(context, typeOfUser));
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isRegisterChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isRegisterChange');
    try {
      return super.isRegisterChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRegister: ${isRegister},
isLoading: ${isLoading},
isLock: ${isLock}
    ''';
  }
}
