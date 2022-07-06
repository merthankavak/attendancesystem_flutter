import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/listview/onboard_indicator.dart';
import '../model/onboard_model.dart';
import '../viewmodel/onboard_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingMediumHorizontal,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Expanded(flex: 5, child: buildPageView(viewModel)),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) => buildColumnBody(context, viewModel.onBoardItems[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildObserverCircle(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(visible: viewModel.isLoading, child: const CircularProgressIndicator());
        }))),
        buildFloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  Observer buildObserverCircle(OnBoardViewModel viewModel) {
    return Observer(builder: (_) {
      return OnBoardIndicator(
          itemCount: viewModel.onBoardItems.length, currentIndex: viewModel.currentIndex);
    });
  }

  FloatingActionButton buildFloatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colorSchemeLight.blue,
      child: Icon(
        FontAwesomeIcons.angleRight,
        color: context.colors.primaryContainer,
      ),
      onPressed: () => viewModel.completeToOnBoard(),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingNormalVertical,
          child: buildAutoLocalTextDescription(model, context),
        )
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline4!,
    );
  }

  AutoLocaleText buildAutoLocalTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1!,
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
