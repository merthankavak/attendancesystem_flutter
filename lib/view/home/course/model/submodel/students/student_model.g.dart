// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: json['_id'] as String?,
      stdId: json['stdId'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      studentImageModel: json['studentImageModel'] == null
          ? null
          : StudentImageModel.fromJson(
              json['studentImageModel'] as Map<String, dynamic>),
      attendanceStatus: json['attendanceStatus'] as bool?,
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stdId': instance.stdId,
      'email': instance.email,
      'fullName': instance.fullName,
      'studentImageModel': instance.studentImageModel,
      'attendanceStatus': instance.attendanceStatus,
    };
