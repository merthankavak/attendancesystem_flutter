import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'students_array_model.g.dart';

@JsonSerializable()
class StudentsArray extends INetworkModel<StudentsArray> {
  @JsonKey(name: '_id')
  final String? id;
  final String? stdId;
  final String? email;
  final String? fullName;
  bool? attendanceStatus;

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
