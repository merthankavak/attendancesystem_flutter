import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/button/title_text_button.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../_product/_widgets/form/pincode_text_field.dart';
import '../../viewmodel/subviewmodel/confirm_otp_view_model.dart';

class ConfirmOtpView extends StatelessWidget {
  final String typeOfUser;
  final String email;
  const ConfirmOtpView({Key? key, required this.email, required this.typeOfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ConfirmOtpViewModel>(
      viewModel: ConfirmOtpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ConfirmOtpViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : Padding(
                  padding: context.paddingNormalHorizontal,
                  child: buildForm(viewModel, context),
                );
        }),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, ConfirmOtpViewModel viewModel) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            viewModel.sendToLoginView();
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft)),
    );
  }

  Form buildForm(ConfirmOtpViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.formStateConfirmOtp,
      child: Column(
        children: [
          const Spacer(flex: 1),
          buildTextRichOtp(context, viewModel),
          const Spacer(flex: 2),
          OtpPinCodeTextField(viewModel: viewModel),
          const Spacer(flex: 2),
          Countdown(
              seconds: 300,
              build: (BuildContext context, double time) => Text(
                  LocaleKeys.confirmotp_expired.tr() +
                      time.toInt().toString() +
                      LocaleKeys.confirmotp_second.tr(),
                  style: context.textTheme.subtitle1),
              interval: const Duration(seconds: 1),
              onFinished: () {
                viewModel.sendToLoginView();
              }),
          const Spacer(flex: 1),
          buildTextRichResend(context, viewModel),
          const Spacer(flex: 1),
          buildElevatedButtonConfirm(context, viewModel),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget buildTextRichOtp(BuildContext context, ConfirmOtpViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.confirmotp_title.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: context.colors.onPrimary),
              ),
              TextSpan(
                text: LocaleKeys.confirmotp_desc.tr(),
                style: Theme.of(context).textTheme.subtitle1!,
              )
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget buildTextRichResend(BuildContext context, ConfirmOtpViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: LocaleKeys.confirmotp_receive.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w400, color: context.colors.onSecondary),
            children: [
              TextSpan(
                text: LocaleKeys.confirmotp_resend.tr(),
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      viewModel.fetchResendOtpCodeToEmail(context, email.toString(), typeOfUser),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w400, color: context.colorSchemeLight.blue),
              )
            ]),
      ),
    );
  }

  Widget buildElevatedButtonConfirm(BuildContext context, ConfirmOtpViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.fetchConfirmOtpCode(viewModel.currentText.toString(), typeOfUser);
                },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.confirmotp_confirm.tr(),
                  style: context.textTheme.headline6!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }
}
