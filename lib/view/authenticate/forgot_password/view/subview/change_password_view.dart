import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/button/title_text_button.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/extension/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../viewmodel/subviewmodel/change_password_view_model.dart';

class ChangePasswordView extends StatelessWidget {
  final String otpCode;
  final String typeOfUser;

  const ChangePasswordView({Key? key, required this.otpCode, required this.typeOfUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePasswordViewModel>(
      viewModel: ChangePasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ChangePasswordViewModel viewModel) => Scaffold(
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

  AppBar buildAppBar(BuildContext context, ChangePasswordViewModel viewModel) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            viewModel.sendToLoginView();
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft)),
    );
  }

  Form buildForm(ChangePasswordViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.formStateChangePassword,
      child: Column(
        children: [
          const Spacer(flex: 1),
          buildTextRichChangePassword(context, viewModel),
          const Spacer(flex: 1),
          buildTextFormFieldPassword(viewModel),
          buildTextFormFieldConfirmPassword(viewModel),
          const Spacer(flex: 1),
          buildElevatedButtonConfirm(context, viewModel),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldPassword(ChangePasswordViewModel viewModel) {
    return TextFormField(
      controller: viewModel.passwordController,
      validator: (value) =>
          value!.isValidPasswords ? null : 'Min 8 characters, 1 uppercase, 1 lowercase, 1 number',
      decoration: InputDecoration(
          labelText: LocaleKeys.changepassword_password.tr(),
          prefixIcon: const Icon(Icons.password)),
    );
  }

  TextFormField buildTextFormFieldConfirmPassword(ChangePasswordViewModel viewModel) {
    return TextFormField(
      controller: viewModel.confirmPasswordController,
      validator: (value) {
        if (value!.isValidPasswords && value == viewModel.passwordController!.text) {
          return null;
        } else if (value.isValidPasswords && value != viewModel.passwordController!.text) {
          return 'Password does not match';
        } else {
          return 'Min 8 characters, 1 uppercase, 1 lowercase, 1 number';
        }
      },
      decoration: InputDecoration(
          labelText: LocaleKeys.changepassword_confirmpassword.tr(),
          prefixIcon: const Icon(Icons.password)),
    );
  }

  Widget buildTextRichChangePassword(BuildContext context, ChangePasswordViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.changepassword_title.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: context.colors.onPrimary),
              ),
              TextSpan(
                  text: LocaleKeys.changepassword_desc.tr(),
                  style: Theme.of(context).textTheme.subtitle1!)
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget buildElevatedButtonConfirm(BuildContext context, ChangePasswordViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.fetchConfirmChangePassword(context, otpCode, typeOfUser);
                },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.changepassword_confirm.tr(),
                  style: context.textTheme.headline6!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }
}
