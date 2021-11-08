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
  Future<CourseModel?> addCourseControl(
      TeacherModel teacherModel, CourseModel courseModel, String token);
  Future<CourseModel?> addCourseScheduleControl(
      String id, String courseStartDate, String courseEndDate, String courseTime, String token);
  Future<CourseModel?> updateCourseControl(CourseModel courseModel, String token);
  Future<CourseModel?> deleteCourseControl(CourseModel courseModel, String token);
  Future<CourseModel?> getOneCourseTeacherControl(CourseModel courseModel, String token);
  Future<CourseModel?> getCourseListTeacherControl(TeacherModel teacherModel, String token);

  //Student Course Control
  Future<CourseModel?> joinCourseControl(
      StudentModel studentModel, CourseModel courseModel, String token);
  Future<CourseModel?> leaveCourseControl(
      StudentModel studentModel, CourseModel courseModel, String token);
  Future<CourseModel?> getOneCourseStudentControl(
      StudentModel studentModel, CourseModel courseModel, String token);
  Future<CourseModel?> getCourseListStudentControl(StudentModel studentModel, String token);
}
