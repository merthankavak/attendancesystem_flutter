import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../course/model/submodel/image/boundingBox/bounding_box_model.dart';

part 'students_array_model.g.dart';

@JsonSerializable()
class StudentsArray extends INetworkModel<StudentsArray> {
  @JsonKey(name: '_id')
  final String? id;
  final String? stdId;
  final String? email;
  final String? fullName;
  String? attendanceStatus;
  BoundingBoxModel? boundingBoxModel;
  String? confidence;

  StudentsArray(
      {this.id,
      this.stdId,
      this.email,
      this.fullName,
      this.attendanceStatus,
      this.boundingBoxModel,
      this.confidence});

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
