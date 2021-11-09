// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courselist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseListModel _$CourseListModelFromJson(Map<String, dynamic> json) =>
    CourseListModel(
      courseList: (json['courseList'] as List<dynamic>?)
          ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseListModelToJson(CourseListModel instance) =>
    <String, dynamic>{
      'courseList': instance.courseList,
    };
