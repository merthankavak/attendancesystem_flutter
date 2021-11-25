// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageAttendanceModel _$ManageAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    ManageAttendanceModel(
      totalStudent: json['totalStudent'] as int?,
      participateStudent: json['participateStudent'] as int?,
      absentStudent: json['absentStudent'] as int?,
      studentsArray: (json['studentsArray'] as List<dynamic>?)
          ?.map((e) => StudentsArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ManageAttendanceModelToJson(
        ManageAttendanceModel instance) =>
    <String, dynamic>{
      'totalStudent': instance.totalStudent,
      'participateStudent': instance.participateStudent,
      'absentStudent': instance.absentStudent,
      'studentsArray': instance.studentsArray,
      'message': instance.message,
    };
