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
      imageUrl: json['imageUrl'] as String?,
      boundingBoxModel: json['boundingBoxModel'] == null
          ? null
          : BoundingBoxModel.fromJson(
              json['boundingBoxModel'] as Map<String, dynamic>),
      attendanceStatus: json['attendanceStatus'] as String?,
      confidence: json['confidence'] as String?,
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stdId': instance.stdId,
      'email': instance.email,
      'fullName': instance.fullName,
      'studentImageModel': instance.studentImageModel,
      'imageUrl': instance.imageUrl,
      'boundingBoxModel': instance.boundingBoxModel,
      'attendanceStatus': instance.attendanceStatus,
      'confidence': instance.confidence,
    };
