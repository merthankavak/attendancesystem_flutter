// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordViewModel on _ForgotPasswordViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ForgotPasswordViewModelBase.isLoading', context: context);

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

  late final _$fetchSendOtpCodeToEmailAsyncAction = AsyncAction(
      '_ForgotPasswordViewModelBase.fetchSendOtpCodeToEmail',
      context: context);

  @override
  Future<void> fetchSendOtpCodeToEmail(String typeOfUser) {
    return _$fetchSendOtpCodeToEmailAsyncAction
        .run(() => super.fetchSendOtpCodeToEmail(typeOfUser));
  }

  late final _$_ForgotPasswordViewModelBaseActionController =
      ActionController(name: '_ForgotPasswordViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_ForgotPasswordViewModelBaseActionController
        .startAction(name: '_ForgotPasswordViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_ForgotPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
