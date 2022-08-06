// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseDetailViewModel on _CourseDetailViewModelBase, Store {
  Computed<ManageAttendanceModel?>? _$manageAttendanceModelsComputed;

  @override
  ManageAttendanceModel? get manageAttendanceModels =>
      (_$manageAttendanceModelsComputed ??= Computed<ManageAttendanceModel?>(
              () => super.manageAttendanceModels,
              name: '_CourseDetailViewModelBase.manageAttendanceModels'))
          .value;
  Computed<CourseModel?>? _$courseDetailModelComputed;

  @override
  CourseModel? get courseDetailModel => (_$courseDetailModelComputed ??=
          Computed<CourseModel?>(() => super.courseDetailModel,
              name: '_CourseDetailViewModelBase.courseDetailModel'))
      .value;
  Computed<List<AttendanceStatusModel>?>?
      _$courseStudentAttendanceStatusComputed;

  @override
  List<AttendanceStatusModel>? get courseStudentAttendanceStatus =>
      (_$courseStudentAttendanceStatusComputed ??= Computed<
                  List<AttendanceStatusModel>?>(
              () => super.courseStudentAttendanceStatus,
              name: '_CourseDetailViewModelBase.courseStudentAttendanceStatus'))
          .value;

  late final _$detailModelAtom =
      Atom(name: '_CourseDetailViewModelBase.detailModel', context: context);

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

  late final _$manageAttendanceModelAtom = Atom(
      name: '_CourseDetailViewModelBase.manageAttendanceModel',
      context: context);

  @override
  ManageAttendanceModel? get manageAttendanceModel {
    _$manageAttendanceModelAtom.reportRead();
    return super.manageAttendanceModel;
  }

  @override
  set manageAttendanceModel(ManageAttendanceModel? value) {
    _$manageAttendanceModelAtom.reportWrite(value, super.manageAttendanceModel,
        () {
      super.manageAttendanceModel = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_CourseDetailViewModelBase.currentIndex', context: context);

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
      Atom(name: '_CourseDetailViewModelBase.isLoading', context: context);

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

  late final _$statusArrayAtom =
      Atom(name: '_CourseDetailViewModelBase.statusArray', context: context);

  @override
  List<dynamic> get statusArray {
    _$statusArrayAtom.reportRead();
    return super.statusArray;
  }

  @override
  set statusArray(List<dynamic> value) {
    _$statusArrayAtom.reportWrite(value, super.statusArray, () {
      super.statusArray = value;
    });
  }

  late final _$getCourseDetailAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.getCourseDetail',
      context: context);

  @override
  Future<void> getCourseDetail(String typeOfUser, String courseId) {
    return _$getCourseDetailAsyncAction
        .run(() => super.getCourseDetail(typeOfUser, courseId));
  }

  late final _$sendCourseDetailViewAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.sendCourseDetailView',
      context: context);

  @override
  Future<void> sendCourseDetailView(String typeOfUser, String courseId) {
    return _$sendCourseDetailViewAsyncAction
        .run(() => super.sendCourseDetailView(typeOfUser, courseId));
  }

  late final _$sendCourseSchduleViewAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.sendCourseSchduleView',
      context: context);

  @override
  Future<void> sendCourseSchduleView(String typeOfUser, String courseId) {
    return _$sendCourseSchduleViewAsyncAction
        .run(() => super.sendCourseSchduleView(typeOfUser, courseId));
  }

  late final _$sendCourseDetailSettingsViewAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.sendCourseDetailSettingsView',
      context: context);

  @override
  Future<void> sendCourseDetailSettingsView(
      String typeOfUser, String courseId) {
    return _$sendCourseDetailSettingsViewAsyncAction
        .run(() => super.sendCourseDetailSettingsView(typeOfUser, courseId));
  }

  late final _$sendCourseAttendanceViewAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.sendCourseAttendanceView',
      context: context);

  @override
  Future<void> sendCourseAttendanceView(
      String typeOfUser, String courseId, String date) {
    return _$sendCourseAttendanceViewAsyncAction
        .run(() => super.sendCourseAttendanceView(typeOfUser, courseId, date));
  }

  late final _$updateCourseAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.updateCourse', context: context);

  @override
  Future<void> updateCourse(String courseId, String typeOfUser) {
    return _$updateCourseAsyncAction
        .run(() => super.updateCourse(courseId, typeOfUser));
  }

  late final _$addCourseScheduleAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.addCourseSchedule',
      context: context);

  @override
  Future<void> addCourseSchedule(String courseId, String typeOfUser) {
    return _$addCourseScheduleAsyncAction
        .run(() => super.addCourseSchedule(courseId, typeOfUser));
  }

  late final _$takeAttendanceStatusAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.takeAttendanceStatus',
      context: context);

  @override
  Future<void> takeAttendanceStatus(
      String typeOfUser, String date, String id, Media file) {
    return _$takeAttendanceStatusAsyncAction
        .run(() => super.takeAttendanceStatus(typeOfUser, date, id, file));
  }

  late final _$manageAttendanceStatusAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.manageAttendanceStatus',
      context: context);

  @override
  Future<void> manageAttendanceStatus(
      String typeOfUser, String date, String id) {
    return _$manageAttendanceStatusAsyncAction
        .run(() => super.manageAttendanceStatus(typeOfUser, date, id));
  }

  late final _$showAttendanceStatusAsyncAction = AsyncAction(
      '_CourseDetailViewModelBase.showAttendanceStatus',
      context: context);

  @override
  Future<void> showAttendanceStatus(String date, String id) {
    return _$showAttendanceStatusAsyncAction
        .run(() => super.showAttendanceStatus(date, id));
  }

  late final _$showPickerAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.showPicker', context: context);

  @override
  Future<void> showPicker(
      CourseDetailViewModel viewModel, BuildContext context, int index) {
    return _$showPickerAsyncAction
        .run(() => super.showPicker(viewModel, context, index));
  }

  late final _$_CourseDetailViewModelBaseActionController =
      ActionController(name: '_CourseDetailViewModelBase', context: context);

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
manageAttendanceModel: ${manageAttendanceModel},
currentIndex: ${currentIndex},
isLoading: ${isLoading},
statusArray: ${statusArray},
manageAttendanceModels: ${manageAttendanceModels},
courseDetailModel: ${courseDetailModel},
courseStudentAttendanceStatus: ${courseStudentAttendanceStatus}
    ''';
  }
}
