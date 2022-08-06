// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../_product/_utility/decoration_helper.dart';
import '../../../_product/_widgets/dialog/upload_image_dialog.dart';
import '../../profile/model/student_profile_response_model.dart';
import '../../profile/model/teacher_profile_response_model.dart';
import '../model/submodel/course/course_model.dart';
import '../model/submodel/courselist_model.dart';
import '../model/submodel/students/student_model.dart';
import '../model/submodel/teacher/teacher_model.dart';
import '../service/ICourseService.dart';
import '../service/course_service.dart';

part 'course_view_model.g.dart';

class CourseViewModel = _CourseViewModelBase with _$CourseViewModel;

abstract class _CourseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  GlobalKey<FormState> floatingActionFormStudent = GlobalKey();
  GlobalKey<FormState> floatingActionFormTeacher = GlobalKey();

  TextEditingController? courseCodeController;
  TextEditingController? courseShortNameController;
  TextEditingController? courseNameController;

  late DecorationHelper helper;
  late ICourseService courseService;

  @observable
  CourseListModel? courseListModel;

  @observable
  StudentProfileResponseModel? studentProfileResponseModel;

  @observable
  TeacherProfileResponseModel? teacherProfileResponseModel;

  @computed
  StudentModel? get studentModel => studentProfileResponseModel!.student;

  @computed
  TeacherModel? get teacherModel => teacherProfileResponseModel!.teacher;

  @computed
  List<CourseModel>? get courseList => courseListModel?.courseList;

  @observable
  bool isLoading = false;

  String? id = '';
  String? token = '';

  @override
  void init() {
    helper = DecorationHelper(context: baseContext);
    courseService = CourseService(vexanaManager!.networkManager, scaffoldKey);
    courseCodeController = TextEditingController();
    courseShortNameController = TextEditingController();
    courseNameController = TextEditingController();
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

  void sendCourseDetailView(String typeOfUser, String courseId) async {
    _changeLoading();
    await navigation.navigateToPage(
        path: NavigationConstants.COURSE_DETAIL_VIEW, data: '$typeOfUser,$courseId');
    _changeLoading();
  }

  void sendProfileView(String typeOfUser) async {
    _changeLoading();
    await navigation.navigateToPage(path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
    _changeLoading();
  }

  Future<dynamic> alertDialog(String typeOfUser, BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return UploadImageDialog(
          onPressed: () async {
            await navigation.navigateToPage(
                path: NavigationConstants.PROFILE_VIEW, data: typeOfUser);
          },
        );
      },
    );
  }

  @action
  Future<void> getCoursesList(String typeOfUser) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      courseListModel = await courseService.getCourseListStudentControl(id!, token!);
    }
    if (typeOfUser == 'teacher') {
      courseListModel = await courseService.getCourseListTeacherControl(id!, token!);
    }
    _changeLoading();
  }

  @action
  Future<void> deleteCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    }
    final response = await courseService.deleteCourseControl(courseId, token!);
    if (response != null) {
      await navigation.navigateToPageClear(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
    }
    _changeLoading();
  }

  @action
  Future<void> leaveCourse(String courseId, String typeOfUser) async {
    _changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    }
    final response = await courseService.leaveCourseControl(id!, courseId, token!);
    if (response != null) {
      await navigation.navigateToPageClear(path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
    }
    _changeLoading();
  }

  @action
  Future<void> getUserInformation(String typeOfUser) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      studentProfileResponseModel = await courseService.showStudentInfo(token!, id!);
    }
    if (typeOfUser == 'teacher') {
      teacherProfileResponseModel = await courseService.showTeacherInfo(token!, id!);
    }
    _changeLoading();
  }

  @action
  Future<void> floatingButtonControl(BuildContext context, String typeOfUser) async {
    _changeLoading();
    if (typeOfUser == 'student') {
      if (floatingActionFormStudent.currentState!.validate()) {
        if (navigation.navigatorKey.currentState!.canPop()) {
          navigation.navigatorKey.currentState!.pop();
        }
        if (studentModel!.imageUrl == null) {
          await alertDialog(typeOfUser, context);
        } else {
          final response = await courseService.joinCourseControl(
              id!, CourseModel(courseCode: courseCodeController!.text), token!);
          if (response != null) {
            await navigation.navigateToPageClear(
                path: NavigationConstants.COURSE_VIEW, data: typeOfUser);
          }
        }
      }
    }
    if (typeOfUser == 'teacher') {
      if (floatingActionFormTeacher.currentState!.validate()) {
        if (navigation.navigatorKey.currentState!.canPop()) {
          navigation.navigatorKey.currentState!.pop();
        }
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
    _changeLoading();
  }
}
