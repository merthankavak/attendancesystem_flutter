// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentProfileResponseModel _$StudentProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentProfileResponseModel(
      student: json['student'] == null
          ? null
          : StudentModel.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentProfileResponseModelToJson(
        StudentProfileResponseModel instance) =>
    <String, dynamic>{
      'student': instance.student,
    };
