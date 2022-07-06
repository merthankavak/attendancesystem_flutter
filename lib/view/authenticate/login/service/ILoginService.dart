// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/login_model.dart';
import '../model/login_response_model.dart';

abstract class ILoginService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  ILoginService(this.manager, this.scaffoldyKey);
  Future<LoginResponseModel?> fetchLoginControl(LoginModel model, String typeOfUser);
  Future<LoginResponseModel?> fetchRegisterControl(LoginModel model, String typeOfUser);
}
