import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel extends INetworkModel<TeacherModel> {
  @JsonKey(name: '_id')
  final String? id;
  final String? fullName;
  final String? email;

  TeacherModel({this.id, this.fullName, this.email});

  @override
  TeacherModel fromJson(Map<String, dynamic> json) {
    return _$TeacherModelFromJson(json);
  }

  @override
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return _$TeacherModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TeacherModelToJson(this);
  }
}
