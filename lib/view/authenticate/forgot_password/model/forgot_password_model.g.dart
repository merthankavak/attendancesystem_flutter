// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordModel _$ForgotPasswordModelFromJson(Map<String, dynamic> json) =>
    ForgotPasswordModel(
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      email: json['email'] as String?,
      otpCode: json['otpCode'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordModelToJson(
        ForgotPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otpCode': instance.otpCode,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
