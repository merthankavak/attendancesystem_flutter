import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../course/model/submodel/students/student_model.dart';

part 'student_profile_response_model.g.dart';

@JsonSerializable()
class StudentProfileResponseModel extends INetworkModel<StudentProfileResponseModel> {
  StudentModel? student;

  StudentProfileResponseModel({this.student});

  @override
  StudentProfileResponseModel fromJson(Map<String, dynamic> json) {
    return _$StudentProfileResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$StudentProfileResponseModelToJson(this);
  }
}
