import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'students_array_model.g.dart';

@JsonSerializable()
class StudentsArray extends INetworkModel<StudentsArray> {
  final String? sId;
  final String? stdId;
  final String? email;
  final String? fullName;
  final bool? attendanceStatus;

  StudentsArray({this.sId, this.stdId, this.email, this.fullName, this.attendanceStatus});

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
