import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          buildScaffoldBody(context, viewModel),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: context.colorSchemeLight.green,
        body: SafeArea(
            child: Stack(
          children: [
            buildCenterTextWelcome(context, viewModel),
            buildAnimatedAlignIcon(viewModel, context),
          ],
        )),
      );
    });
  }

  Center buildCenterTextWelcome(BuildContext context, SplashViewModel viewModel) {
    return Center(child: Observer(builder: (_) {
      return AnimatedOpacity(
        duration: context.normalDuration,
        opacity: viewModel.isFirstInit ? 0 : 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.splash_welcome.tr(),
              style: context.textTheme.headline6!.copyWith(color: context.colorSchemeLight.white),
              textAlign: TextAlign.center,
            ),
            const CircularProgressIndicator.adaptive()
          ],
        ),
      );
    }));
  }

  Widget buildAnimatedAlignIcon(SplashViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedAlign(
          alignment: viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
          duration: context.lowDuration,
          child: Image.asset(
            ImageConstants.instance.projeIcon,
            width: context.height * 0.6,
            height: context.width * 0.6,
          ));
    });
  }
}
