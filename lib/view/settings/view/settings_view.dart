import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/enum/lottie_path_enum.dart';
import '../../menu/view/menu_view.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  final String typeOfUser;
  const SettingsView({Key? key, required this.typeOfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Observer(
        builder: (_) {
          return Scaffold(
              key: viewModel.scaffoldKey,
              appBar: buildAppBar(context, viewModel),
              drawer: const MenuView(),
              body: viewModel.isLoading
                  ? buildCenter()
                  : SingleChildScrollView(child: buildSettingsContainer(context, viewModel)));
        },
      ),
    );
  }

  Container buildSettingsContainer(BuildContext context, SettingsViewModel viewModel) {
    return Container(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height * 0.02),
          Text(LocaleKeys.setting_appSettings_title.tr(),
              style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600)),
          Divider(color: context.colorScheme.onSecondary),
          buildChangeThemeCard(context, viewModel),
          buildChangeLanguageCard(context, viewModel),
          context.emptySizedHeightBoxLow,
          Text(LocaleKeys.setting_about_title.tr(),
              style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600)),
          Divider(color: context.colorScheme.onSecondary),
          buildApplicationTourCard(context, viewModel),
          context.emptySizedHeightBoxHigh,
          context.emptySizedHeightBoxHigh,
          context.emptySizedHeightBoxHigh,
          buildAppVersionText(context),
        ],
      ),
    );
  }

  Center buildAppVersionText(BuildContext context) {
    return Center(
      child: Text(''.version,
          textAlign: TextAlign.center,
          style: context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w200)),
    );
  }

  Card buildApplicationTourCard(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      color: context.colorScheme.primaryContainer,
      child: ListTile(
        onTap: viewModel.navigateToOnBoard,
        title: Text(LocaleKeys.setting_about_appInfo.tr()),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }

  Card buildChangeLanguageCard(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      color: context.colorScheme.primaryContainer,
      child: ListTile(
        title: Text(LocaleKeys.setting_appSettings_langTitle.tr()),
        subtitle: Text(LocaleKeys.setting_appSettings_langDesc.tr()),
        trailing: Observer(builder: (_) {
          return DropdownButton<Locale>(items: [
            DropdownMenuItem(
                value: LanguageManager.instance.trLocale,
                child: Text(LanguageManager.instance.trLocale.languageCode.toUpperCase())),
            DropdownMenuItem(
                value: LanguageManager.instance.enLocale,
                child: Text(LanguageManager.instance.enLocale.languageCode.toUpperCase())),
          ], onChanged: viewModel.changeAppLocalization, value: viewModel.appLocale);
        }),
      ),
    );
  }

  Card buildChangeThemeCard(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      color: context.colorScheme.primaryContainer,
      child: ListTile(
        title: Text(LocaleKeys.setting_appSettings_themeTitle.tr()),
        subtitle: Text(LocaleKeys.setting_appSettings_themeDesc.tr()),
        trailing: Observer(builder: (_) {
          return IconButton(
              onPressed: () async {
                await viewModel.changeAppTheme();
              },
              icon: context.watch<ThemeNotifier>().currenThemeEnum == AppThemes.LIGHT
                  ? LottiePathEnum.MOON.toWidget
                  : LottiePathEnum.SUNNY.toWidget);
        }),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, SettingsViewModel viewModel) {
    return AppBar(
        title: Text(LocaleKeys.setting_title.tr()),
        leading: IconButton(
            onPressed: () {
              viewModel.scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(FontAwesomeIcons.alignLeft)));
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());
}
