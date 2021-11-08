import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../courses/model/submodel/students/student_model.dart';
import '../model/course_model.dart';
import '../model/submodel/teacher/teacher_model.dart';

abstract class ICourseService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  ICourseService(this.manager, this.scaffoldyKey);

  //Teacher Course Control
  Future<CourseModel?> addCourseControl(TeacherModel teacherModel, CourseModel courseModel);
  Future<CourseModel?> addCourseScheduleControl(
      String courseStartDate, String courseEndDate, String courseTime);
  Future<CourseModel?> updateCourseControl(CourseModel courseModel);
  Future<CourseModel?> deleteCourseControl(CourseModel courseModel);
  Future<CourseModel?> getOneCourseTeacherControl(CourseModel courseModel);
  Future<CourseModel?> getCourseListControl(TeacherModel teacherModel);

  //Student Course Control
  Future<CourseModel?> joinCourseControl(StudentModel studentModel, CourseModel courseModel);
  Future<CourseModel?> leaveCourseControl(StudentModel studentModel, CourseModel courseModel);
  Future<CourseModel?> getOneCourseStudentControl(
      StudentModel studentModel, CourseModel courseModel);
  Future<CourseModel?> getCourseListStudentControl(StudentModel studentModel);
}
