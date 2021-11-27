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

  final _$imageFromGalleryAtom =
      Atom(name: '_CourseDetailViewModelBase.imageFromGallery');

  @override
  XFile? get imageFromGallery {
    _$imageFromGalleryAtom.reportRead();
    return super.imageFromGallery;
  }

  @override
  set imageFromGallery(XFile? value) {
    _$imageFromGalleryAtom.reportWrite(value, super.imageFromGallery, () {
      super.imageFromGallery = value;
    });
  }

  final _$imageFromCameraAtom =
      Atom(name: '_CourseDetailViewModelBase.imageFromCamera');

  @override
  XFile? get imageFromCamera {
    _$imageFromCameraAtom.reportRead();
    return super.imageFromCamera;
  }

  @override
  set imageFromCamera(XFile? value) {
    _$imageFromCameraAtom.reportWrite(value, super.imageFromCamera, () {
      super.imageFromCamera = value;
    });
  }

  final _$imageFromCameraFileAtom =
      Atom(name: '_CourseDetailViewModelBase.imageFromCameraFile');

  @override
  File? get imageFromCameraFile {
    _$imageFromCameraFileAtom.reportRead();
    return super.imageFromCameraFile;
  }

  @override
  set imageFromCameraFile(File? value) {
    _$imageFromCameraFileAtom.reportWrite(value, super.imageFromCameraFile, () {
      super.imageFromCameraFile = value;
    });
  }

  final _$imageFromGalleryFileAtom =
      Atom(name: '_CourseDetailViewModelBase.imageFromGalleryFile');

  @override
  File? get imageFromGalleryFile {
    _$imageFromGalleryFileAtom.reportRead();
    return super.imageFromGalleryFile;
  }

  @override
  set imageFromGalleryFile(File? value) {
    _$imageFromGalleryFileAtom.reportWrite(value, super.imageFromGalleryFile,
        () {
      super.imageFromGalleryFile = value;
    });
  }

  final _$pickerAtom = Atom(name: '_CourseDetailViewModelBase.picker');

  @override
  ImagePicker? get picker {
    _$pickerAtom.reportRead();
    return super.picker;
  }

  @override
  set picker(ImagePicker? value) {
    _$pickerAtom.reportWrite(value, super.picker, () {
      super.picker = value;
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

  final _$pickImageFromGalleryAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.pickImageFromGallery');

  @override
  Future<void> pickImageFromGallery(
      String typeOfUser, String courseId, String date) {
    return _$pickImageFromGalleryAsyncAction
        .run(() => super.pickImageFromGallery(typeOfUser, courseId, date));
  }

  final _$pickImageFromCameraAsyncAction =
      AsyncAction('_CourseDetailViewModelBase.pickImageFromCamera');

  @override
  Future<void> pickImageFromCamera(
      String typeOfUser, String courseId, String date) {
    return _$pickImageFromCameraAsyncAction
        .run(() => super.pickImageFromCamera(typeOfUser, courseId, date));
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
imageFromGallery: ${imageFromGallery},
imageFromCamera: ${imageFromCamera},
imageFromCameraFile: ${imageFromCameraFile},
imageFromGalleryFile: ${imageFromGalleryFile},
picker: ${picker},
currentIndex: ${currentIndex},
isLoading: ${isLoading},
courseDetailModel: ${courseDetailModel}
    ''';
  }
}
