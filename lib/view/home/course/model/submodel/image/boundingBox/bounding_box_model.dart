import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'bounding_box_model.g.dart';

@JsonSerializable()
class BoundingBoxModel extends INetworkModel<BoundingBoxModel> {
  String? height;
  String? left;
  String? top;
  String? width;

  BoundingBoxModel({this.height, this.left, this.top, this.width});

  @override
  BoundingBoxModel fromJson(Map<String, dynamic> json) {
    return _$BoundingBoxModelFromJson(json);
  }

  @override
  factory BoundingBoxModel.fromJson(Map<String, dynamic> json) {
    return _$BoundingBoxModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BoundingBoxModelToJson(this);
  }
}
