// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_array_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsArray _$StudentsArrayFromJson(Map<String, dynamic> json) =>
    StudentsArray(
      id: json['_id'] as String?,
      stdId: json['stdId'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      attendanceStatus: json['attendanceStatus'] as bool?,
    );

Map<String, dynamic> _$StudentsArrayToJson(StudentsArray instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stdId': instance.stdId,
      'email': instance.email,
      'fullName': instance.fullName,
      'attendanceStatus': instance.attendanceStatus,
    };
