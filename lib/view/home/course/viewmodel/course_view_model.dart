import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_utility/decoration_helper.dart';
import '../model/submodel/course/course_model.dart';
import '../model/submodel/courselist_model.dart';
import '../service/ICourseService.dart';
import '../service/course_service.dart';

part 'course_view_model.g.dart';

class CourseViewModel = _CourseViewModelBase with _$CourseViewModel;

abstract class _CourseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> floatingActionFormStudent = GlobalKey();
  GlobalKey<FormState> floatingActionFormTeacher = GlobalKey();

  TextEditingController? courseCodeController;
  TextEditingController? courseShortNameController;
  TextEditingController? courseNameController;
  TextEditingController? courseStartDateController;
  TextEditingController? courseEndDateController;
  TextEditingController? courseTimeController;
  late DecorationHelper helper;
  late ICourseService courseService;

  @observable
  CourseListModel? courseListModel;

  @observable
  CourseModel? courseModel;

  @observable
  bool isLoading = false;

  String? id = '';
  String? token = '';

  @override
  void init() {
    helper = DecorationHelper(context: context);
    courseService = CourseService(vexanaManager!.networkManager, scaffoldKey);
    courseCodeController = TextEditingController();
    courseShortNameController = TextEditingController();
    courseNameController = TextEditingController();
    courseStartDateController = TextEditingController();
    courseEndDateController = TextEditingController();
    courseTimeController = TextEditingController();
    getPrefs();
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
  Future<void> getCoursesList(String typeOfUser) async {
    _changeLoading();
    typeOfUser == 'student'
        ? courseListModel = await courseService.getCourseListStudentControl(id!, token!)
        : await courseService.getCourseListTeacherControl(id!, token!);
    _changeLoading();
  }

  @action
  Future<void> getCourseDetail(String typeOfUser, String courseId) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      courseModel = await courseService.getOneCourseStudentControl(id!, courseId, token!);
      if (courseModel != null) {
        await navigation.navigateToPageClear(
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: [typeOfUser, courseId]);
      }
    } else {
      courseModel = await courseService.getOneCourseTeacherControl(courseId, token!);
      if (courseModel != null) {
        await navigation.navigateToPageClear(
            path: NavigationConstants.COURSE_DETAIL_VIEW, data: [typeOfUser, courseId]);
      }
    }

    _changeLoading();
  }

  @action
  Future<void> deleteCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    final response = await courseService.deleteCourseControl(courseId, token!);
    if (response != null) {
      await navigation.navigateToPageClear(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
    }
    _changeLoading();
  }

  @action
  Future<void> leaveCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    final response = await courseService.leaveCourseControl(id!, courseId, token!);
    if (response != null) {
      await navigation.navigateToPageClear(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
    }
    _changeLoading();
  }

  @action
  Future<void> updateCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    final response = await courseService.updateCourseControl(
        CourseModel(
            courseName: courseNameController!.text,
            courseShortName: courseShortNameController!.text),
        token!);
    if (response != null) {
      await navigation.navigateToPageClear(
          path: NavigationConstants.COURSE_DETAIL_VIEW, data: [typeOfUser, courseId]);
    }
    _changeLoading();
  }

  @action
  Future<void> addCourseSchedule(String courseId, String typeOfUser) async {
    _changeLoading();
    final response = await courseService.addCourseScheduleControl(
        courseId,
        courseStartDateController!.text,
        courseEndDateController!.text,
        courseTimeController!.text,
        token!);

    if (response != null) {
      await navigation.navigateToPageClear(
          path: NavigationConstants.COURSE_DETAIL_VIEW, data: [typeOfUser, courseId]);
    }
    _changeLoading();
  }

  @action
  Future<void> floatingButtonControl(String typeOfUser) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      if (floatingActionFormStudent.currentState!.validate()) {
        final response = await courseService.joinCourseControl(
            id!, CourseModel(courseCode: courseCodeController!.text), token!);
        if (response != null) {
          await navigation.navigateToPageClear(
              path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
        }
      }
    } else {
      if (floatingActionFormTeacher.currentState!.validate()) {
        final response = await courseService.addCourseControl(
            id!,
            CourseModel(
                courseShortName: courseShortNameController!.text,
                courseName: courseNameController!.text),
            token!);
        if (response != null) {
          await navigation.navigateToPageClear(
              path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
        }
      }
    }
  }
}
