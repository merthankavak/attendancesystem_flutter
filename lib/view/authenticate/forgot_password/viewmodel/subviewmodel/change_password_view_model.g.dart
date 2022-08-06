// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordViewModel on _ChangePasswordViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ChangePasswordViewModelBase.isLoading', context: context);

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

  late final _$fetchConfirmChangePasswordAsyncAction = AsyncAction(
      '_ChangePasswordViewModelBase.fetchConfirmChangePassword',
      context: context);

  @override
  Future<void> fetchConfirmChangePassword(
      BuildContext context, String otpCode, String typeOfUser) {
    return _$fetchConfirmChangePasswordAsyncAction.run(
        () => super.fetchConfirmChangePassword(context, otpCode, typeOfUser));
  }

  late final _$_ChangePasswordViewModelBaseActionController =
      ActionController(name: '_ChangePasswordViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_ChangePasswordViewModelBaseActionController
        .startAction(name: '_ChangePasswordViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_ChangePasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
