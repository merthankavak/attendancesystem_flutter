import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'byte/image_byte_model.dart';

part 'student_image_model.g.dart';

@JsonSerializable()
class StudentImageModel extends INetworkModel<StudentImageModel> {
  ImageByteModel? imageByte;
  String? fileType;

  StudentImageModel({this.imageByte, this.fileType});

  @override
  StudentImageModel fromJson(Map<String, dynamic> json) {
    return _$StudentImageModelFromJson(json);
  }

  @override
  factory StudentImageModel.fromJson(Map<String, dynamic> json) {
    return _$StudentImageModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StudentImageModelToJson(this);
  }
}
