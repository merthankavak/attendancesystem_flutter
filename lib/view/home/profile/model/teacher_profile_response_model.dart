import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../course/model/submodel/teacher/teacher_model.dart';

part 'teacher_profile_response_model.g.dart';

@JsonSerializable()
class TeacherProfileResponseModel extends INetworkModel<TeacherProfileResponseModel> {
  TeacherModel? teacher;

  TeacherProfileResponseModel({this.teacher});

  @override
  TeacherProfileResponseModel fromJson(Map<String, dynamic> json) {
    return _$TeacherProfileResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TeacherProfileResponseModelToJson(this);
  }
}
