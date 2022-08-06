// ignore_for_file: prefer_single_quotes, library_private_types_in_public_api

import 'dart:io';

import 'package:attendancesystem_flutter/core/extension/context_extension.dart';
import 'package:attendancesystem_flutter/core/init/lang/locale_keys.g.dart';
import 'package:attendancesystem_flutter/view/_product/_utility/decoration_helper.dart';
import 'package:attendancesystem_flutter/view/home/attendance/model/manage_attendance_model.dart';
import 'package:attendancesystem_flutter/view/home/course/model/submodel/attendance_status/attendance_status_model.dart';
import 'package:attendancesystem_flutter/view/home/course/model/submodel/course/course_model.dart';
import 'package:attendancesystem_flutter/view/home/course/model/submodel/detail/detail_model.dart';
import 'package:attendancesystem_flutter/view/home/course/service/ICourseService.dart';
import 'package:attendancesystem_flutter/view/home/course/service/course_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/base/viewmodel/base_view_model.dart';

part 'course_detail_view_model.g.dart';

class CourseDetailViewModel = _CourseDetailViewModelBase with _$CourseDetailViewModel;

abstract class _CourseDetailViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  GlobalKey<ScaffoldState> detailScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> detailSettingsScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> attendanceViewScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> courseScheduleViewScaffoldKey = GlobalKey();
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
  ManageAttendanceModel? get manageAttendanceModels => manageAttendanceModel!;

  @computed
  CourseModel? get courseDetailModel => detailModel!.course;

  @computed
  List<AttendanceStatusModel>? get courseStudentAttendanceStatus => detailModel!.attendance;

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  var statusArray = [];

  String? id = '';
  String? token = '';

  @override
  void init() {
    helper = DecorationHelper(context: baseContext);
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
    if (typeOfUser == 'teacher') {
      _changeLoading();
      detailModel = await courseService.getOneCourseTeacherControl(courseId, id!, token!);
      _changeLoading();
    }
    if (typeOfUser == 'student') {
      _changeLoading();
      detailModel = await courseService.getOneCourseStudentControl(id!, courseId, token!);
      _changeLoading();
    }
  }

  @action
  Future<void> sendCourseDetailView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_DETAIL_VIEW, data: '$typeOfUser,$courseId');
    _changeLoading();
  }

  @action
  Future<void> sendCourseSchduleView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_SCHEDULE_VIEW, data: '$typeOfUser,$courseId');
    _changeLoading();
  }

  @action
  Future<void> sendCourseDetailSettingsView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_DETAIL_SETTINGS_VIEW, data: '$typeOfUser,$courseId');
    _changeLoading();
  }

  @action
  Future<void> sendCourseAttendanceView(String typeOfUser, String courseId, String date) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.ATTENDANCE_VIEW, data: '$typeOfUser,$courseId,$date');
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
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: '$typeOfUser,$courseId');
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
          '${courseStartTimeController!.text}-${courseEndTimeController!.text}',
          token!);

      if (response != null) {
        await navigation.navigateToPageClear(
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: '$typeOfUser,$courseId');
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
    var imageFile = File(file.path!);
    await courseService.takeAttendance(date, id, token!, imageFile);
    await navigation.navigateToPageClear(
        path: NavigationConstants.ATTENDANCE_VIEW, data: '$typeOfUser,$id,$date');
    _changeLoading();
  }

  @action
  Future<void> manageAttendanceStatus(String typeOfUser, String date, String id) async {
    _changeLoading();
    manageAttendanceModel = await courseService.manageAttendance(date, id, token!, statusArray);
    _changeLoading();
  }

  @action
  Future<void> showAttendanceStatus(String date, String id) async {
    _changeLoading();
    manageAttendanceModel = await courseService.showAttendance(date, id, token!);
    statusArray = List.generate(manageAttendanceModel!.studentsArray!.length,
        (index) => manageAttendanceModel!.studentsArray![index].attendanceStatus.toString());
    _changeLoading();
  }

  @action
  Future<void> showPicker(CourseDetailViewModel viewModel, BuildContext context, int index) async {
    _changeLoading();
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                Observer(builder: (_) {
                  return ListTile(
                      leading: Icon(Icons.check_box, color: context.colorSchemeLight.green),
                      title: Text(LocaleKeys.course_teacher_attendance_participants.tr()),
                      onTap: () async {
                        if (navigation.navigatorKey.currentState!.canPop()) {
                          navigation.navigatorKey.currentState!.pop();
                        }
                        viewModel.manageAttendanceModel!.studentsArray![index].attendanceStatus =
                            'true';
                        viewModel.statusArray[index] = 'true';
                      });
                }),
                Observer(builder: (_) {
                  return ListTile(
                    leading: Icon(Icons.cancel_outlined, color: context.colorSchemeLight.red),
                    title: Text(LocaleKeys.course_teacher_attendance_absent.tr()),
                    onTap: () async {
                      if (navigation.navigatorKey.currentState!.canPop()) {
                        navigation.navigatorKey.currentState!.pop();
                      }
                      viewModel.manageAttendanceModel!.studentsArray![index].attendanceStatus =
                          'false';
                      viewModel.statusArray[index] = 'false';
                    },
                  );
                }),
              ],
            ),
          );
        });
    _changeLoading();
  }
}
