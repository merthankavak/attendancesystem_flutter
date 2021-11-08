import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../students/student_model.dart';

part 'attendance_model.g.dart';

@JsonSerializable()
class AttendanceModel extends INetworkModel<AttendanceModel> {
  @JsonKey(name: '_id')
  final String? id;
  final String? date;
  final String? time;
  final List<StudentModel>? students;

  AttendanceModel({this.id, this.date, this.time, this.students});

  @override
  AttendanceModel fromJson(Map<String, dynamic> json) {
    return _$AttendanceModelFromJson(json);
  }

  @override
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$AttendanceModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AttendanceModelToJson(this);
  }
}
