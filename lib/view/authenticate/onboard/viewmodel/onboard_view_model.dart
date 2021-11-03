import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/svg_image_paths.dart';
import '../model/onboard_model.dart';

part 'onboard_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @override
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title.tr(),
        LocaleKeys.onBoard_page1_desc.tr(), SVGImagePaths.instance.onBoard1SVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title.tr(),
        LocaleKeys.onBoard_page2_desc.tr(), SVGImagePaths.instance.onBoard1SVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title.tr(),
        LocaleKeys.onBoard_page3_desc.tr(), SVGImagePaths.instance.onBoard1SVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page4_title.tr(),
        LocaleKeys.onBoard_page4_desc.tr(), SVGImagePaths.instance.onBoard1SVG));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_OPEN, true);
    changeLoading();

    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    }
  }
}
