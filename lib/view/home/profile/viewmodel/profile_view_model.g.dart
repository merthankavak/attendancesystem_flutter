// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  Computed<TeacherModel?>? _$teacherModelComputed;

  @override
  TeacherModel? get teacherModel => (_$teacherModelComputed ??=
          Computed<TeacherModel?>(() => super.teacherModel,
              name: '_ProfileViewModelBase.teacherModel'))
      .value;
  Computed<StudentModel?>? _$studentModelComputed;

  @override
  StudentModel? get studentModel => (_$studentModelComputed ??=
          Computed<StudentModel?>(() => super.studentModel,
              name: '_ProfileViewModelBase.studentModel'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_ProfileViewModelBase.isLoading', context: context);

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

  late final _$studentProfileResponseModelAtom = Atom(
      name: '_ProfileViewModelBase.studentProfileResponseModel',
      context: context);

  @override
  StudentProfileResponseModel? get studentProfileResponseModel {
    _$studentProfileResponseModelAtom.reportRead();
    return super.studentProfileResponseModel;
  }

  @override
  set studentProfileResponseModel(StudentProfileResponseModel? value) {
    _$studentProfileResponseModelAtom
        .reportWrite(value, super.studentProfileResponseModel, () {
      super.studentProfileResponseModel = value;
    });
  }

  late final _$teacherProfileResponseModelAtom = Atom(
      name: '_ProfileViewModelBase.teacherProfileResponseModel',
      context: context);

  @override
  TeacherProfileResponseModel? get teacherProfileResponseModel {
    _$teacherProfileResponseModelAtom.reportRead();
    return super.teacherProfileResponseModel;
  }

  @override
  set teacherProfileResponseModel(TeacherProfileResponseModel? value) {
    _$teacherProfileResponseModelAtom
        .reportWrite(value, super.teacherProfileResponseModel, () {
      super.teacherProfileResponseModel = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ProfileViewModelBase.changePassword', context: context);

  @override
  Future<void> changePassword(BuildContext context, String typeOfUser) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(context, typeOfUser));
  }

  late final _$updateStudentProfilePictureAsyncAction = AsyncAction(
      '_ProfileViewModelBase.updateStudentProfilePicture',
      context: context);

  @override
  Future<void> updateStudentProfilePicture(String typeOfUser, Media file) {
    return _$updateStudentProfilePictureAsyncAction
        .run(() => super.updateStudentProfilePicture(typeOfUser, file));
  }

  late final _$updateStudentFullNameAsyncAction = AsyncAction(
      '_ProfileViewModelBase.updateStudentFullName',
      context: context);

  @override
  Future<void> updateStudentFullName(String typeOfUser) {
    return _$updateStudentFullNameAsyncAction
        .run(() => super.updateStudentFullName(typeOfUser));
  }

  late final _$updateTeacherFullNameAsyncAction = AsyncAction(
      '_ProfileViewModelBase.updateTeacherFullName',
      context: context);

  @override
  Future<void> updateTeacherFullName(String typeOfUser) {
    return _$updateTeacherFullNameAsyncAction
        .run(() => super.updateTeacherFullName(typeOfUser));
  }

  late final _$getUserInformationAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUserInformation', context: context);

  @override
  Future<void> getUserInformation(String typeOfUser) {
    return _$getUserInformationAsyncAction
        .run(() => super.getUserInformation(typeOfUser));
  }

  late final _$logutAppAsyncAction =
      AsyncAction('_ProfileViewModelBase.logutApp', context: context);

  @override
  Future<void> logutApp() {
    return _$logutAppAsyncAction.run(() => super.logutApp());
  }

  late final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
studentProfileResponseModel: ${studentProfileResponseModel},
teacherProfileResponseModel: ${teacherProfileResponseModel},
teacherModel: ${teacherModel},
studentModel: ${studentModel}
    ''';
  }
}
