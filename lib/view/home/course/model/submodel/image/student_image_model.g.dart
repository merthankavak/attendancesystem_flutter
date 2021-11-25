// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentImageModel _$StudentImageModelFromJson(Map<String, dynamic> json) =>
    StudentImageModel(
      imageByte: json['imageByte'] == null
          ? null
          : ImageByteModel.fromJson(json['imageByte'] as Map<String, dynamic>),
      fileType: json['fileType'] as String?,
    );

Map<String, dynamic> _$StudentImageModelToJson(StudentImageModel instance) =>
    <String, dynamic>{
      'imageByte': instance.imageByte,
      'fileType': instance.fileType,
    };
