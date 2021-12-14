// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherProfileResponseModel _$TeacherProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    TeacherProfileResponseModel(
      teacher: json['teacher'] == null
          ? null
          : TeacherModel.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherProfileResponseModelToJson(
        TeacherProfileResponseModel instance) =>
    <String, dynamic>{
      'teacher': instance.teacher,
    };
