import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'submodel/students_array_model.dart';

part 'manage_attendance_model.g.dart';

@JsonSerializable()
class ManageAttendanceModel extends INetworkModel<ManageAttendanceModel> {
  final int? totalStudent;
  final int? participateStudent;
  final int? absentStudent;
  final List<StudentsArray>? studentsArray;
  final String? message;

  ManageAttendanceModel({
    this.totalStudent,
    this.participateStudent,
    this.absentStudent,
    this.studentsArray,
    this.message,
  });

  @override
  ManageAttendanceModel fromJson(Map<String, dynamic> json) {
    return _$ManageAttendanceModelFromJson(json);
  }

  @override
  factory ManageAttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$ManageAttendanceModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ManageAttendanceModelToJson(this);
  }
}
