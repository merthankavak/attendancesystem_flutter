import 'dart:io';

import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_enum/network_route_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../model/submodel/course/course_model.dart';
import '../model/submodel/courselist_model.dart';
import 'ICourseService.dart';

class CourseService extends ICourseService with ServiceHelper {
  CourseService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<CourseModel?> addCourseControl(
      String teacherId, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/addcourse',
      parseModel: CourseModel(),
      method: RequestType.POST,
      data: {
        'teacherId': teacherId,
        'courseShortName': courseModel.courseShortName,
        'courseName': courseModel.courseName
      },
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
  Future<CourseModel?> deleteCourseControl(String id, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/deletecourse/' + id,
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
  Future<CourseModel?> getOneCourseTeacherControl(String id, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/' + id,
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
  Future<CourseListModel?> getCourseListTeacherControl(String teacherId, String token) async {
    final response = await manager.send<CourseListModel, CourseListModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: '/course/list/' + teacherId,
      parseModel: CourseListModel(),
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
  Future<CourseListModel?> getCourseListStudentControl(String studentId, String token) async {
    final response = await manager.send<CourseListModel, CourseListModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/list/' + studentId,
      parseModel: CourseListModel(),
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
  Future<CourseModel?> getOneCourseStudentControl(String studentId, String id, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/' + id,
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
      String studentId, CourseModel courseModel, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/joincourse',
      parseModel: CourseModel(),
      method: RequestType.POST,
      data: {'studentId': studentId, 'courseCode': courseModel.courseCode},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<CourseModel?> leaveCourseControl(String id, String courseId, String token) async {
    final response = await manager.send<CourseModel, CourseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: '/course/leave/' + id,
      parseModel: CourseModel(),
      method: RequestType.DELETE,
      data: {'courseId': courseId},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );

    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
