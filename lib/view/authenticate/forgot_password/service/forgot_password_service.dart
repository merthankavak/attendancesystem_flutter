import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_enum/network_route_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../model/forgot_password_model.dart';
import 'IForgotPasswordService.dart';

class ForgotPasswordService extends IForgotPasswordService with ServiceHelper {
  ForgotPasswordService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey)
      : super(manager, scaffoldKey);

  @override
  Future<ForgotPasswordModel?> changePassword(
      ForgotPasswordModel model, String otpCode, String typeOfUser) async {
    final response = await manager.send<ForgotPasswordModel, ForgotPasswordModel>(
      NetworkRoutes.AUTH.rawValue,
      urlSuffix: '$typeOfUser/reset/$otpCode',
      parseModel: ForgotPasswordModel(),
      method: RequestType.POST,
      data: model,
    );

    if (response.data is ForgotPasswordModel) {
      return response.data;
    } else {
      showMessage(scaffoldKey, response.error);
    }
    return null;
  }

  @override
  Future<ForgotPasswordModel?> confirmOtpCode(ForgotPasswordModel model, String typeOfUser) async {
    final response = await manager.send<ForgotPasswordModel, ForgotPasswordModel>(
      NetworkRoutes.AUTH.rawValue,
      urlSuffix: '$typeOfUser/reset',
      parseModel: ForgotPasswordModel(),
      method: RequestType.POST,
      data: model,
    );

    if (response.data is ForgotPasswordModel) {
      return response.data;
    } else {
      showMessage(scaffoldKey, response.error);
    }
    return null;
  }

  @override
  Future<ForgotPasswordModel?> sendOtpCodeToEmail(
      ForgotPasswordModel model, String typeOfUser) async {
    final response = await manager.send<ForgotPasswordModel, ForgotPasswordModel>(
      NetworkRoutes.AUTH.rawValue,
      urlSuffix: '$typeOfUser/recover',
      parseModel: ForgotPasswordModel(),
      method: RequestType.POST,
      data: model,
    );

    showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
