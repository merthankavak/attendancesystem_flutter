// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['_id'] as String?,
      teacher: json['teacher'] == null
          ? null
          : TeacherModel.fromJson(json['teacher'] as Map<String, dynamic>),
      courseShortName: json['courseShortName'] as String?,
      courseName: json['courseName'] as String?,
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendance: (json['attendance'] as List<dynamic>?)
          ?.map(
              (e) => AttendanceStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseCode: json['courseCode'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'teacher': instance.teacher,
      'courseShortName': instance.courseShortName,
      'courseName': instance.courseName,
      'students': instance.students,
      'attendance': instance.attendance,
      'courseCode': instance.courseCode,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
