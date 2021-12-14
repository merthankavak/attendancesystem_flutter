import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../attendance_status/attendance_status_model.dart';
import '../course/course_model.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class DetailModel extends INetworkModel<DetailModel> {
  CourseModel? course;
  List<AttendanceStatusModel>? attendance;

  DetailModel({this.course, this.attendance});

  @override
  DetailModel fromJson(Map<String, dynamic> json) {
    return _$DetailModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DetailModelToJson(this);
  }
}
