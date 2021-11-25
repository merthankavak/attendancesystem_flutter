// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'course': instance.course,
    };
