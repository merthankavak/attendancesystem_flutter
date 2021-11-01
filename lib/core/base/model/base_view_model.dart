import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  BuildContext? context;
  //VexanaManager? vexanaManager = VexanaManager.instance;
  //VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  //NavigationService navigation = NavigationService.instance;
  //LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
