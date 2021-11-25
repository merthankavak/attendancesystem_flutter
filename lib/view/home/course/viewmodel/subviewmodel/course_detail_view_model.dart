import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../_product/_utility/decoration_helper.dart';
import '../../model/submodel/course/course_model.dart';
import '../../model/submodel/detail/detail_model.dart';
import '../../service/ICourseService.dart';
import '../../service/course_service.dart';

part 'course_detail_view_model.g.dart';

class CourseDetailViewModel = _CourseDetailViewModelBase with _$CourseDetailViewModel;

abstract class _CourseDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  GlobalKey<ScaffoldState> detailScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> detailSettingsScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> scheduleScaffoldKey = GlobalKey();

  GlobalKey<FormState> courseScheduleFormKey = GlobalKey();
  GlobalKey<FormState> courseUpdateFormKey = GlobalKey();
  GlobalKey<FormState> courseDetailFormKey = GlobalKey();

  TextEditingController? courseCodeController;
  TextEditingController? courseShortNameController;
  TextEditingController? courseNameController;
  TextEditingController? courseStartDateController;
  TextEditingController? courseEndDateController;
  TextEditingController? courseStartTimeController;
  TextEditingController? courseEndTimeController;
  late DecorationHelper helper;
  late ICourseService courseService;

  @observable
  DetailModel? detailModel;

  @observable
  XFile? imageFromGalery;

  @observable
  XFile? imageFromCamera;

  @observable
  ImagePicker? picker;

  @computed
  CourseModel? get courseDetailModel => detailModel!.course!;

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  String? id = '';
  String? token = '';

  @override
  void init() {
    helper = DecorationHelper(context: context);
    courseService = CourseService(vexanaManager!.networkManager, detailScaffoldKey);
    courseStartDateController = TextEditingController();
    courseEndDateController = TextEditingController();
    courseStartTimeController = TextEditingController();
    courseEndTimeController = TextEditingController();
    courseNameController = TextEditingController();
    courseShortNameController = TextEditingController();
    picker = ImagePicker();
    getPrefs();
  }

  @action
  void changeIndex(int index) {
    currentIndex = index;
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getPrefs() async {
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    id = localeManager.getStringValue(PreferencesKeys.ID);
  }

  @action
  Future<void> getCourseDetail(String typeOfUser, String courseId) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      detailModel = await courseService.getOneCourseStudentControl(id!, courseId, token!);
    }
    if (typeOfUser == 'teacher') {
      detailModel = await courseService.getOneCourseTeacherControl(courseId, token!);
    }
    _changeLoading();
  }

  void sendCourseDetailSettingsView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_DETAIL_SETTINGS_VIEW, data: typeOfUser + ',' + courseId);
    _changeLoading();
  }

  void sendCourseAttendanceView(String typeOfUser, String courseId, String date) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.ATTENDANCE_VIEW, data: typeOfUser + ',' + courseId + ',' + date);
    _changeLoading();
  }

  @action
  Future<void> updateCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    if (courseUpdateFormKey.currentState!.validate()) {
      final response = await courseService.updateCourseControl(
          CourseModel(
              courseName: courseNameController!.text,
              courseShortName: courseShortNameController!.text),
          token!);
      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: typeOfUser + ',' + courseId);
      }
    }
    _changeLoading();
  }

  @action
  Future<void> addCourseSchedule(String courseId, String typeOfUser) async {
    _changeLoading();
    if (courseScheduleFormKey.currentState!.validate()) {
      final response = await courseService.addCourseScheduleControl(
          courseId,
          courseStartDateController!.text,
          courseEndDateController!.text,
          courseStartTimeController!.text + '-' + courseEndTimeController!.text,
          token!);

      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: typeOfUser + ',' + courseId);
      }
    }
    _changeLoading();
  }

  @action
  Future<void> pickImageFromGallery(String typeOfUser, String courseId, String date) async {
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    }
    imageFromGalery = await picker!.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (imageFromGalery != null) {
      final response =
          await courseService.takeAttendance(date, courseId, token!, File(imageFromCamera!.path));
      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.ATTENDANCE_VIEW,
            data: typeOfUser + ',' + courseId + ',' + date);
      }
    }
  }

  @action
  Future<void> pickImageFromCamera(String typeOfUser, String courseId, String date) async {
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    }
    imageFromCamera = await picker!.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (imageFromCamera != null) {
      final response =
          await courseService.takeAttendance(date, courseId, token!, File(imageFromCamera!.path));
      if (response != null) {
        await navigation.navigateToPage(
            path: NavigationConstants.ATTENDANCE_VIEW,
            data: typeOfUser + ',' + courseId + ',' + date);
      }
    }
  }
}
