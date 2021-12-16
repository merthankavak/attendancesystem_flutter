// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManageAttendanceModel _$ManageAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    ManageAttendanceModel(
      totalStudent: json['totalStudent'] as String?,
      participateStudent: json['participateStudent'] as String?,
      absentStudent: json['absentStudent'] as String?,
      studentsArray: (json['studentsArray'] as List<dynamic>?)
          ?.map((e) => StudentsArray.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ManageAttendanceModelToJson(
        ManageAttendanceModel instance) =>
    <String, dynamic>{
      'totalStudent': instance.totalStudent,
      'participateStudent': instance.participateStudent,
      'absentStudent': instance.absentStudent,
      'studentsArray': instance.studentsArray,
      'imageUrl': instance.imageUrl,
    };
