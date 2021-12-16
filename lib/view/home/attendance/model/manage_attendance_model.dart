import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'submodel/students_array_model.dart';

part 'manage_attendance_model.g.dart';

@JsonSerializable()
class ManageAttendanceModel extends INetworkModel<ManageAttendanceModel> {
  final String? totalStudent;
  final String? participateStudent;
  final String? absentStudent;
  final List<StudentsArray>? studentsArray;
  String? imageUrl;

  ManageAttendanceModel(
      {this.totalStudent,
      this.participateStudent,
      this.absentStudent,
      this.studentsArray,
      this.imageUrl});

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
