// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseViewModel on _CourseViewModelBase, Store {
  Computed<List<CourseModel>?>? _$courseListComputed;

  @override
  List<CourseModel>? get courseList => (_$courseListComputed ??=
          Computed<List<CourseModel>?>(() => super.courseList,
              name: '_CourseViewModelBase.courseList'))
      .value;

  final _$courseListModelAtom =
      Atom(name: '_CourseViewModelBase.courseListModel');

  @override
  CourseListModel? get courseListModel {
    _$courseListModelAtom.reportRead();
    return super.courseListModel;
  }

  @override
  set courseListModel(CourseListModel? value) {
    _$courseListModelAtom.reportWrite(value, super.courseListModel, () {
      super.courseListModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CourseViewModelBase.isLoading');

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

  final _$getCoursesListAsyncAction =
      AsyncAction('_CourseViewModelBase.getCoursesList');

  @override
  Future<void> getCoursesList(String typeOfUser) {
    return _$getCoursesListAsyncAction
        .run(() => super.getCoursesList(typeOfUser));
  }

  final _$deleteCourseAsyncAction =
      AsyncAction('_CourseViewModelBase.deleteCourse');

  @override
  Future<void> deleteCourse(String courseId, String typeOfUser) {
    return _$deleteCourseAsyncAction
        .run(() => super.deleteCourse(courseId, typeOfUser));
  }

  final _$leaveCourseAsyncAction =
      AsyncAction('_CourseViewModelBase.leaveCourse');

  @override
  Future<void> leaveCourse(String courseId, String typeOfUser) {
    return _$leaveCourseAsyncAction
        .run(() => super.leaveCourse(courseId, typeOfUser));
  }

  final _$floatingButtonControlAsyncAction =
      AsyncAction('_CourseViewModelBase.floatingButtonControl');

  @override
  Future<void> floatingButtonControl(String typeOfUser) {
    return _$floatingButtonControlAsyncAction
        .run(() => super.floatingButtonControl(typeOfUser));
  }

  final _$_CourseViewModelBaseActionController =
      ActionController(name: '_CourseViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_CourseViewModelBaseActionController.startAction(
        name: '_CourseViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_CourseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courseListModel: ${courseListModel},
isLoading: ${isLoading},
courseList: ${courseList}
    ''';
  }
}
