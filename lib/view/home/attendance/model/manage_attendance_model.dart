import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'manage_attendance_model.g.dart';

@JsonSerializable()
class ManageAttendanceModel extends INetworkModel<ManageAttendanceModel> {
  final int? totalStudent;
  final int? participateStudent;
  final int? absentStudent;
  final List<StudentsArray>? studentsArray;
  final String? message;

  ManageAttendanceModel(
      {this.totalStudent,
      this.participateStudent,
      this.absentStudent,
      this.studentsArray,
      this.message});

  @override
  ManageAttendanceModel fromJson(Map<String, dynamic> json) {
    return _$ManageAttendanceModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ManageAttendanceModelToJson(this);
  }
}

@JsonSerializable()
class StudentsArray extends INetworkModel<StudentsArray> {
  @JsonKey(name: '_id')
  final String? id;
  final String? stdId;
  final String? email;
  final String? fullName;
  final bool? attendanceStatus;

  StudentsArray({this.id, this.stdId, this.email, this.fullName, this.attendanceStatus});

  @override
  StudentsArray fromJson(Map<String, dynamic> json) {
    return _$StudentsArrayFromJson(json);
  }

  @override
  factory StudentsArray.fromJson(Map<String, dynamic> json) {
    return _$StudentsArrayFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StudentsArrayToJson(this);
  }
}
