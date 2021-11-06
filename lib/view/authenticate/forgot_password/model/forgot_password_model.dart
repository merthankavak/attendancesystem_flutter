import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'forgot_password_model.g.dart';

@JsonSerializable()
class ForgotPasswordModel extends INetworkModel<ForgotPasswordModel> {
  final String? email;
  final String? otpCode;
  final String? password;
  final String? confirmPassword;
  ForgotPasswordModel({this.password, this.confirmPassword, this.email, this.otpCode});

  @override
  ForgotPasswordModel fromJson(Map<String, dynamic> json) {
    return _$ForgotPasswordModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPasswordModelToJson(this);
  }
}
