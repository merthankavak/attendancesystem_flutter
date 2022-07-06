import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/menu_view_model.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getToken();
        model.completeToMenu();
      },
      onPageBuilder: (BuildContext context, MenuViewModel viewModel) => Observer(builder: (_) {
        return viewModel.isLoading
            ? buildCenter()
            : Drawer(child: buildDrawerColumn(context, viewModel));
      }),
    );
  }

  Column buildDrawerColumn(BuildContext context, MenuViewModel viewModel) {
    return Column(
      children: <Widget>[
        buildDrawerHeader(context),
        Expanded(child: buildObserverMenuItems(viewModel)),
        buildLogoutListTile(context, viewModel),
      ],
    );
  }

  ListTile buildLogoutListTile(BuildContext context, MenuViewModel viewModel) {
    return ListTile(
        tileColor: context.colorSchemeLight.blue,
        title: Text(LocaleKeys.menu_logout.tr(),
            style: context.textTheme.bodyText1!.copyWith(color: context.colorSchemeLight.white),
            textAlign: TextAlign.center),
        onTap: viewModel.logutApp);
  }

  Observer buildObserverMenuItems(MenuViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.menuItems.length,
        itemBuilder: (context, index) => ListTile(
          selected: index == viewModel.currentIndex,
          leading: viewModel.menuItems[index].leading,
          title: Text(viewModel.menuItems[index].title.tr()),
          trailing: const Icon(Icons.arrow_right),
          onTap: () async {
            await viewModel.changeIndex(index);
            await viewModel.sendToPage(viewModel.menuItems[index].navigationPath);
          },
        ),
      );
    });
  }

  DrawerHeader buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(color: context.colorSchemeLight.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
                title: Text(LocaleKeys.menu_welcome.tr(),
                    maxLines: 1,
                    style: context.textTheme.subtitle2!
                        .copyWith(color: context.colorSchemeLight.white)),
                onTap: null,
                onLongPress: null)
          ],
        ));
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());
}
