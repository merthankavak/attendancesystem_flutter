// ignore_for_file: prefer_single_quotes

import 'dart:io';

import 'package:attendancesystem_flutter/view/home/profile/model/student_profile_response_model.dart';
import 'package:attendancesystem_flutter/view/home/profile/model/teacher_profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_enum/network_route_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../model/profile_response_model.dart';
import 'IProfileService.dart';

class ProfileService extends IProfileService with ServiceHelper {
  ProfileService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(scaffoldyKey, manager);

  @override
  Future<ProfileResponseModel?> updateStudentProfilePhoto(
      File file, String token, String id) async {
    final mimeType = file.path.toString().trim().split('.').last;
    final originalFile = file.path.toString().trim().split('/').last;
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path,
          filename: originalFile, contentType: MediaType("image", mimeType))
    });

    final baseUrl = dotenv.env['APP_API_SITE'].toString();
    await manager.uploadFile(
      "$baseUrl${NetworkRoutes.STUDENT.rawValue}update/$id",
      formData,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.acceptEncodingHeader: 'gzip, deflate, br',
        HttpHeaders.connectionHeader: 'keep-alive',
      },
    );

    return null;
  }

  @override
  Future<ProfileResponseModel?> updateTeacherFullName(
      String fullName, String token, String id) async {
    final response = await manager.send<ProfileResponseModel, ProfileResponseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: 'changefullname/$id',
      parseModel: ProfileResponseModel(),
      method: RequestType.POST,
      data: {'fullName': fullName},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<ProfileResponseModel?> updateStudentFullName(
      String fullName, String token, String id) async {
    final response = await manager.send<ProfileResponseModel, ProfileResponseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: 'changefullname/$id',
      parseModel: ProfileResponseModel(),
      method: RequestType.POST,
      data: {'fullName': fullName},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<ProfileResponseModel?> updateStudentPassword(
      String password, String token, String id) async {
    final response = await manager.send<ProfileResponseModel, ProfileResponseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: 'changepassword/$id',
      parseModel: ProfileResponseModel(),
      method: RequestType.POST,
      data: {'password': password},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<ProfileResponseModel?> updateTeacherPassword(
      String password, String token, String id) async {
    final response = await manager.send<ProfileResponseModel, ProfileResponseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: 'changepassword/$id',
      parseModel: ProfileResponseModel(),
      method: RequestType.POST,
      data: {'password': password},
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<StudentProfileResponseModel?> showStudentInfo(String token, String id) async {
    final response = await manager.send<StudentProfileResponseModel, StudentProfileResponseModel>(
      NetworkRoutes.STUDENT.rawValue,
      urlSuffix: 'show/$id',
      parseModel: StudentProfileResponseModel(),
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
  Future<TeacherProfileResponseModel?> showTeacherInfo(String token, String id) async {
    final response = await manager.send<TeacherProfileResponseModel, TeacherProfileResponseModel>(
      NetworkRoutes.TEACHER.rawValue,
      urlSuffix: 'show/$id',
      parseModel: TeacherProfileResponseModel(),
      method: RequestType.GET,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }),
    );
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
