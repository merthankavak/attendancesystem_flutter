import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'https://localhost:3000/';
  static final String _androidBaseUrl = dotenv.env['APP_API_SITE'].toString();

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    fileManager: LocalFile(),
    options: BaseOptions(
        baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        followRedirects: false),
  );
}
