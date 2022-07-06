// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/profile_response_model.dart';
import '../model/student_profile_response_model.dart';
import '../model/teacher_profile_response_model.dart';

abstract class IProfileService {
  final GlobalKey<ScaffoldState> scaffoldyKey;
  final INetworkManager manager;

  IProfileService(this.scaffoldyKey, this.manager);

  Future<StudentProfileResponseModel?> showStudentInfo(String token, String id);
  Future<TeacherProfileResponseModel?> showTeacherInfo(String token, String id);
  Future<ProfileResponseModel?> updateStudentFullName(String fullName, String token, String id);
  Future<ProfileResponseModel?> updateTeacherFullName(String fullName, String token, String id);
  Future<ProfileResponseModel?> updateStudentProfilePhoto(File file, String token, String id);
  Future<ProfileResponseModel?> updateTeacherPassword(String password, String token, String id);
  Future<ProfileResponseModel?> updateStudentPassword(String password, String token, String id);
}
