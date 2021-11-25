import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'image_byte_model.g.dart';

@JsonSerializable()
class ImageByteModel extends INetworkModel<ImageByteModel> {
  String? type;
  List<int>? data;

  ImageByteModel({this.type, this.data});

  @override
  ImageByteModel fromJson(Map<String, dynamic> json) {
    return _$ImageByteModelFromJson(json);
  }

  @override
  factory ImageByteModel.fromJson(Map<String, dynamic> json) {
    return _$ImageByteModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ImageByteModelToJson(this);
  }
}
