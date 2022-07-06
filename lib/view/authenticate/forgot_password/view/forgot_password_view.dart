import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/forgot_password_view_model.dart';

class ForgotPasswordView extends StatelessWidget {
  final String _validatorText = 'Email does not valid';
  final String typeOfUser;
  const ForgotPasswordView({Key? key, required this.typeOfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ForgotPasswordViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(viewModel),
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

  AppBar buildAppBar(ForgotPasswordViewModel viewModel) {
    return AppBar(
        leading: IconButton(
            onPressed: () {
              viewModel.sendToLoginView();
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft)));
  }

  Form buildForm(ForgotPasswordViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.formStateSendOtpToMail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          buildTextRichForgot(context, viewModel),
          const Spacer(flex: 2),
          buildTextFormFieldEmail(viewModel),
          const Spacer(flex: 2),
          buildElevatedButtonSend(context, viewModel, typeOfUser),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(ForgotPasswordViewModel viewModel) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmails ? null : _validatorText,
      decoration: InputDecoration(
          labelText: LocaleKeys.forgotpassword_email.tr(), prefixIcon: const Icon(Icons.email)),
    );
  }

  Widget buildTextRichForgot(BuildContext context, ForgotPasswordViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.forgotpassword_title.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: context.colors.onPrimary),
              ),
              TextSpan(
                text: LocaleKeys.forgotpassword_desc.tr(),
                style: Theme.of(context).textTheme.subtitle1!,
              )
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget buildElevatedButtonSend(
      BuildContext context, ForgotPasswordViewModel viewModel, String typeOfUser) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.fetchSendOtpCodeToEmail(typeOfUser);
                },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.forgotpassword_send.tr(),
                  style: context.textTheme.headline6!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }
}
