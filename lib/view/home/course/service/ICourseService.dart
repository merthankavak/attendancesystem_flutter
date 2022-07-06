// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../attendance/model/manage_attendance_model.dart';
import '../../profile/model/student_profile_response_model.dart';
import '../../profile/model/teacher_profile_response_model.dart';
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
  Future<DetailModel?> getOneCourseTeacherControl(String id, String teacherId, String token);
  Future<CourseListModel?> getCourseListTeacherControl(String teacherId, String token);
  Future<void> takeAttendance(String date, String id, String token, File file);
  Future<ManageAttendanceModel?> showAttendance(String date, String id, String token);
  Future<ManageAttendanceModel?> manageAttendance(
      String date, String id, String token, dynamic statusArray);
  Future<TeacherProfileResponseModel?> showTeacherInfo(String token, String id);

  //Student Course Control
  Future<CourseModel?> joinCourseControl(String studentId, CourseModel courseModel, String token);
  Future<CourseModel?> leaveCourseControl(String id, String courseId, String token);
  Future<DetailModel?> getOneCourseStudentControl(String studentId, String id, String token);
  Future<CourseListModel?> getCourseListStudentControl(String studentId, String token);
  Future<StudentProfileResponseModel?> showStudentInfo(String token, String id);
}
