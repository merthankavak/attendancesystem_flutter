import 'package:flutter/cupertino.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;
  VexanaManager? vexanaManager = VexanaManager.instance;
  VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  NavigationService navigation = NavigationService.instance;
  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
