import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel extends INetworkModel<ProfileResponseModel> {
  final String? message;

  ProfileResponseModel({this.message});

  @override
  ProfileResponseModel fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ProfileResponseModelToJson(this);
  }
}
