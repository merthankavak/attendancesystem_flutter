// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      id: json['_id'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      attendanceStatus: json['attendanceStatus'] as bool?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'attendanceStatus': instance.attendanceStatus,
      'students': instance.students,
    };
