import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'basic_error_model.g.dart';

@JsonSerializable()
class BasicErrorModel extends INetworkModel<BasicErrorModel> {
  final String? message;

  BasicErrorModel({this.message});

  @override
  BasicErrorModel fromJson(Map<String, dynamic> json) {
    return _$BasicErrorModelFromJson(json);
  }

  @override
  factory BasicErrorModel.fromJson(Map<String, dynamic> json) {
    return _$BasicErrorModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BasicErrorModelToJson(this);
  }
}
