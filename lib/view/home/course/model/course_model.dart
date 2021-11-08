import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'submodel/attendance/attendance_model.dart';
import 'submodel/students/student_model.dart';
import 'submodel/teacher/teacher_model.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel extends INetworkModel<CourseModel> {
  @JsonKey(name: '_id')
  final String? id;
  final TeacherModel? teacher;
  final String? courseShortName;
  final String? courseName;
  final List<StudentModel>? students;
  final List<AttendanceModel>? attendance;
  final String? courseCode;
  final String? createdAt;
  final String? updatedAt;

  CourseModel(this.id,
      {this.teacher,
      this.courseShortName,
      this.courseName,
      this.students,
      this.attendance,
      this.courseCode,
      this.createdAt,
      this.updatedAt});

  @override
  CourseModel fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  @override
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return _$CourseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CourseModelToJson(this);
  }
}
