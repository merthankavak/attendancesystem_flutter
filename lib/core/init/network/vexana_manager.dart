import 'dart:io';

import 'package:vexana/vexana.dart';

import '../../constants/app/app_constants.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'https://localhost:3000/';
  static const String _androidBaseUrl = ApplicationConstants.APP_API_SITE;

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    fileManager: LocalFile(),
    options: BaseOptions(
      baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
    ),
  );
}
