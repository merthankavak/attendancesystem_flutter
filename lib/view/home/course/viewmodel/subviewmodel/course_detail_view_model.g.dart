// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseDetailViewModel on _CourseDetailViewModelBase, Store {
  Computed<CourseModel?>? _$courseDetailModelComputed;

  @override
  CourseModel? get courseDetailModel => (_$courseDetailModelComputed ??=
          Computed<CourseModel?>(() => super.courseDetailModel,
              name: '_CourseDetailViewModelBase.courseDetailModel'))
      .value;

  final _$detailModelAtom =
      Atom(name: '_CourseDetailViewModelBase.detailModel');

  @override
  DetailModel? get detailModel {
    _$detailModelAtom.reportRead();
    return super.detailModel;
  }

  @override
  set detailModel(DetailModel? value) {
    _$detailModelAtom.reportWrite(value, super.detailModel, () {
      super.detailModel = value;
    });
  }

  final _$currentIndexAtom =
      Atom(name: '_CourseDetailViewModelBase.currentIndex');

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

  final _$isLoadingAtom = Atom(name: '_CourseDetailViewModelBase.isLoading');

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

  final _$getCourseDetailAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.getCourseDetail');

  @override
  Future<void> getCourseDetail(String typeOfUser, String courseId) {
    return _$getCourseDetailAsyncAction
        .run(() => super.getCourseDetail(typeOfUser, courseId));
  }

  final _$updateCourseAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.updateCourse');

  @override
  Future<void> updateCourse(String courseId, String typeOfUser) {
    return _$updateCourseAsyncAction
        .run(() => super.updateCourse(courseId, typeOfUser));
  }

  final _$addCourseScheduleAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.addCourseSchedule');

  @override
  Future<void> addCourseSchedule(String courseId, String typeOfUser) {
    return _$addCourseScheduleAsyncAction
        .run(() => super.addCourseSchedule(courseId, typeOfUser));
  }

  final _$takeAttendanceAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.takeAttendance');

  @override
  Future<void> takeAttendance(
      String typeOfUser, String date, String id, String token, XFile file) {
    return _$takeAttendanceAsyncAction
        .run(() => super.takeAttendance(typeOfUser, date, id, token, file));
  }

  final _$_CourseDetailViewModelBaseActionController =
      ActionController(name: '_CourseDetailViewModelBase');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$_CourseDetailViewModelBaseActionController
        .startAction(name: '_CourseDetailViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_CourseDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_CourseDetailViewModelBaseActionController
        .startAction(name: '_CourseDetailViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_CourseDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
detailModel: ${detailModel},
currentIndex: ${currentIndex},
isLoading: ${isLoading},
courseDetailModel: ${courseDetailModel}
    ''';
  }
}
