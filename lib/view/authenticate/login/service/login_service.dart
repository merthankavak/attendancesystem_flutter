import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_enum/network_route_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<LoginResponseModel?> fetchLoginControl(LoginModel model, String typeOfUser) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetworkRoutes.AUTH.rawValue,
        urlSuffix: '$typeOfUser/login',
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
    return null;
  }

  @override
  Future<LoginResponseModel?> fetchRegisterControl(LoginModel model, String typeOfUser) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetworkRoutes.AUTH.rawValue,
        urlSuffix: '$typeOfUser/register',
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
    return null;
  }
}
