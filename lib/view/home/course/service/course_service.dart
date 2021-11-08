import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexana/src/interface/INetworkService.dart';

import '../../../_product/_utility/service_helper.dart';
import '../../courses/model/submodel/students/student_model.dart';
import '../model/course_model.dart';
import '../model/submodel/teacher/teacher_model.dart';
import 'ICourseService.dart';

class CourseService extends ICourseService with ServiceHelper {
  CourseService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<CourseModel?> addCourseControl(TeacherModel teacherModel, CourseModel courseModel) {
    // TODO: implement addCourseControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> addCourseScheduleControl(
      String courseStartDate, String courseEndDate, String courseTime) {
    // TODO: implement addCourseScheduleControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> deleteCourseControl(CourseModel courseModel) {
    // TODO: implement deleteCourseControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> getCourseListControl(TeacherModel teacherModel) {
    // TODO: implement getCourseListControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> getCourseListStudentControl(StudentModel studentModel) {
    // TODO: implement getCourseListStudentControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> getOneCourseStudentControl(
      StudentModel studentModel, CourseModel courseModel) {
    // TODO: implement getOneCourseStudentControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> getOneCourseTeacherControl(CourseModel courseModel) {
    // TODO: implement getOneCourseTeacherControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> joinCourseControl(StudentModel studentModel, CourseModel courseModel) {
    // TODO: implement joinCourseControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> leaveCourseControl(StudentModel studentModel, CourseModel courseModel) {
    // TODO: implement leaveCourseControl
    throw UnimplementedError();
  }

  @override
  Future<CourseModel?> updateCourseControl(CourseModel courseModel) {
    // TODO: implement updateCourseControl
    throw UnimplementedError();
  }
}
