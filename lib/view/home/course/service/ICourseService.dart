import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/submodel/course/course_model.dart';
import '../model/submodel/courselist_model.dart';
import '../model/submodel/detail/detail_model.dart';

abstract class ICourseService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  ICourseService(this.manager, this.scaffoldyKey);

  //Teacher Course Control
  Future<CourseModel?> addCourseControl(String teacherId, CourseModel courseModel, String token);
  Future<CourseModel?> addCourseScheduleControl(
      String id, String courseStartDate, String courseEndDate, String courseTime, String token);
  Future<CourseModel?> updateCourseControl(CourseModel courseModel, String token);
  Future<CourseModel?> deleteCourseControl(String id, String token);
  Future<DetailModel?> getOneCourseTeacherControl(String id, String token);
  Future<CourseListModel?> getCourseListTeacherControl(String teacherId, String token);

  //Student Course Control
  Future<CourseModel?> joinCourseControl(String studentId, CourseModel courseModel, String token);
  Future<CourseModel?> leaveCourseControl(String id, String courseId, String token);
  Future<DetailModel?> getOneCourseStudentControl(String studentId, String id, String token);
  Future<CourseListModel?> getCourseListStudentControl(String studentId, String token);
}
