import 'dart:io';

import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_enum/network_route_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../../courses/model/submodel/students/student_model.dart';
import '../model/course_model.dart';
import '../model/submodel/teacher/teacher_model.dart';
import 'ICourseService.dart';

class CourseService extends ICourseService with ServiceHelper {
  CourseService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<CourseModel?> addCourseControl(
      TeacherModel teacherModel, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/addcourse',
      parseModel: CourseModel(),
      method: RequestType.POST,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> addCourseScheduleControl(String id, String courseStartDate,
      String courseEndDate, String courseTime, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/addschedule/$id',
      parseModel: CourseModel(),
      method: RequestType.POST,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> updateCourseControl(CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/update/' + courseModel.id!,
      parseModel: CourseModel(),
      method: RequestType.POST,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> deleteCourseControl(CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/deletecourse/' + courseModel.id!,
      parseModel: CourseModel(),
      method: RequestType.DELETE,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> getOneCourseTeacherControl(CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/' + courseModel.id!,
      parseModel: CourseModel(),
      method: RequestType.GET,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> getCourseListTeacherControl(TeacherModel teacherModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/list/' + teacherModel.id!,
      parseModel: CourseModel(),
      method: RequestType.GET,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> getCourseListStudentControl(StudentModel studentModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/list/' + studentModel.id!,
      parseModel: CourseModel(),
      method: RequestType.GET,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> getOneCourseStudentControl(
      StudentModel studentModel, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/' + courseModel.id!,
      parseModel: CourseModel(),
      method: RequestType.GET,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> joinCourseControl(
      StudentModel studentModel, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/joincourse',
      parseModel: CourseModel(),
      method: RequestType.POST,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> leaveCourseControl(
      StudentModel studentModel, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/leave/' + studentModel.id!,
      parseModel: CourseModel(),
      method: RequestType.DELETE,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
