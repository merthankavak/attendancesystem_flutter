// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceStatusModel _$AttendanceStatusModelFromJson(
        Map<String, dynamic> json) =>
    AttendanceStatusModel(
      id: json['_id'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      attendanceStatus: json['attendanceStatus'] as String?,
      imageUrl: json['imageUrl'] as String?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceStatusModelToJson(
        AttendanceStatusModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'attendanceStatus': instance.attendanceStatus,
      'imageUrl': instance.imageUrl,
      'students': instance.students,
    };
