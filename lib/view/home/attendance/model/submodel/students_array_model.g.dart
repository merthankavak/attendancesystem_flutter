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
      attendanceStatus: json['attendanceStatus'] as String?,
      boundingBoxModel: json['boundingBoxModel'] == null
          ? null
          : BoundingBoxModel.fromJson(
              json['boundingBoxModel'] as Map<String, dynamic>),
      confidence: json['confidence'] as String?,
    );

Map<String, dynamic> _$StudentsArrayToJson(StudentsArray instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stdId': instance.stdId,
      'email': instance.email,
      'fullName': instance.fullName,
      'attendanceStatus': instance.attendanceStatus,
      'boundingBoxModel': instance.boundingBoxModel,
      'confidence': instance.confidence,
    };
