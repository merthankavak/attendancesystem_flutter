import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../course/course_model.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class DetailModel extends INetworkModel<DetailModel> {
  CourseModel? course;

  DetailModel({this.course});

  @override
  DetailModel fromJson(Map<String, dynamic> json) {
    return _$DetailModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DetailModelToJson(this);
  }
}
