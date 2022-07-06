// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/forgot_password_model.dart';

abstract class IForgotPasswordService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IForgotPasswordService(this.manager, this.scaffoldKey);

  Future<ForgotPasswordModel?> sendOtpCodeToEmail(ForgotPasswordModel model, String typeOfUser);
  Future<ForgotPasswordModel?> confirmOtpCode(ForgotPasswordModel model, String typeOfUser);
  Future<ForgotPasswordModel?> changePassword(
      ForgotPasswordModel model, String otpCode, String typeOfUser);
}
