import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'course/course_model.dart';

part 'courselist_model.g.dart';

@JsonSerializable()
class CourseListModel extends INetworkModel<CourseListModel> {
  List<CourseModel>? courseList;

  CourseListModel({this.courseList});

  @override
  CourseListModel fromJson(Map<String, dynamic> json) {
    return _$CourseListModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CourseListModelToJson(this);
  }
}
