// ignore_for_file: prefer_single_quotes

import 'dart:io';

import 'package:attendancesystem_flutter/view/home/attendance/model/manage_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:image_pickers/image_pickers.dart';
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
  GlobalKey<ScaffoldState> attendanceViewScaffoldKey = GlobalKey();

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
  ManageAttendanceModel? manageAttendanceModel;

  @computed
  String? get manageAttendanceModels => manageAttendanceModel!.absentStudent;

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

  @action
  Future<void> sendCourseDetailSettingsView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_DETAIL_SETTINGS_VIEW, data: typeOfUser + ',' + courseId);
    _changeLoading();
  }

  @action
  Future<void> sendCourseAttendanceView(String typeOfUser, String courseId, String date) async {
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
  Future<void> takeAttendanceStatus(String typeOfUser, String date, String id, Media file) async {
    _changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    }
    var imageFile = await File(file.path!);
    await courseService.takeAttendance(date, id, token!, imageFile);
    await navigation.navigateToPage(
        path: NavigationConstants.ATTENDANCE_VIEW, data: typeOfUser + ',' + id + ',' + date);
    _changeLoading();
  }

  @action
  Future<void> showAttendanceStatus(String date, String id) async {
    _changeLoading();
    manageAttendanceModel = await courseService.showAttendance(date, id, token!);
    _changeLoading();
  }
}
