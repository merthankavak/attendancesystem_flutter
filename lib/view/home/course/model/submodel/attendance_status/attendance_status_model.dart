import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../students/student_model.dart';

part 'attendance_status_model.g.dart';

@JsonSerializable()
class AttendanceStatusModel extends INetworkModel<AttendanceStatusModel> {
  @JsonKey(name: '_id')
  final String? id;
  final String? date;
  final String? time;
  String? attendanceStatus;
  String? imageUrl;
  final List<StudentModel>? students;

  AttendanceStatusModel(
      {this.id, this.date, this.time, this.attendanceStatus, this.imageUrl, this.students});

  @override
  AttendanceStatusModel fromJson(Map<String, dynamic> json) {
    return _$AttendanceStatusModelFromJson(json);
  }

  @override
  factory AttendanceStatusModel.fromJson(Map<String, dynamic> json) {
    return _$AttendanceStatusModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AttendanceStatusModelToJson(this);
  }
}
