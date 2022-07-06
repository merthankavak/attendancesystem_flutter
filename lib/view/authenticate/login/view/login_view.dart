import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/svg_image_paths.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            body: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenter()
                  : SafeArea(
                      child: TabBarView(children: [
                        Column(
                          children: [
                            buildSVGImageContainer(context),
                            buildTabBarContainer(context),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: context.paddingNormal,
                                child: viewModel.isRegister
                                    ? buildFormTeacherRegister(viewModel, context)
                                    : buildFormTeacherLogin(viewModel, context),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildSVGImageContainer(context),
                            buildTabBarContainer(context),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: context.paddingNormal,
                                child: viewModel.isRegister
                                    ? buildFormStudentRegister(viewModel, context)
                                    : buildFormStudentLogin(viewModel, context),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    );
            }),
          );
        }),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  Container buildSVGImageContainer(BuildContext context) {
    return Container(
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: context.colors.surface,
        child: Center(child: buildSVGImage()));
  }

  SvgPicture buildSVGImage() => SvgPicture.asset(SVGImagePaths.instance.loginSVG);

  Container buildTabBarContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(tabs: [
      Tab(text: LocaleKeys.login_tab1.tr()),
      Tab(text: LocaleKeys.login_tab2.tr()),
    ]);
  }

  Widget buildFormTeacherLogin(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.always,
        key: viewModel.formStateTeacherLogin,
        child: Column(
          children: [
            const Spacer(flex: 2),
            buildTextFormFieldEmail(context, viewModel),
            const Spacer(),
            buildTextFormFieldPassword(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichForgot(context, viewModel),
            const Spacer(flex: 2),
            buildElevatedButtonLogin(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichSignIn(viewModel, context),
            const Spacer(flex: 2),
          ],
        ),
      );
    });
  }

  Widget buildFormTeacherRegister(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.always,
        key: viewModel.formStateTeacherRegister,
        child: Column(
          children: [
            const Spacer(flex: 1),
            buildTextFormFieldName(context, viewModel),
            const Spacer(),
            buildTextFormFieldEmail(context, viewModel),
            const Spacer(),
            buildTextFormFieldPassword(context, viewModel),
            const Spacer(flex: 2),
            buildElevatedButtonRegister(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichSignUp(context, viewModel),
            const Spacer(flex: 2),
          ],
        ),
      );
    });
  }

  Widget buildFormStudentLogin(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.always,
        key: viewModel.formStateStudentLogin,
        child: Column(
          children: [
            const Spacer(flex: 2),
            buildTextFormFieldEmail(context, viewModel),
            const Spacer(),
            buildTextFormFieldPassword(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichForgot(context, viewModel),
            const Spacer(flex: 2),
            buildElevatedButtonLogin(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichSignIn(viewModel, context),
            const Spacer(flex: 2),
          ],
        ),
      );
    });
  }

  Widget buildFormStudentRegister(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        autovalidateMode: AutovalidateMode.always,
        key: viewModel.formStateStudentRegister,
        child: Column(
          children: [
            const Spacer(flex: 1),
            buildTextFormFieldName(context, viewModel),
            const Spacer(),
            buildTextFormFieldEmail(context, viewModel),
            const Spacer(),
            buildTextFormFieldPassword(context, viewModel),
            const Spacer(flex: 2),
            buildElevatedButtonRegister(context, viewModel),
            const Spacer(flex: 2),
            buildTextRichSignUp(context, viewModel),
            const Spacer(flex: 2),
          ],
        ),
      );
    });
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: DefaultTabController.of(context)!.index == 0
            ? viewModel.teacherPasswordController
            : viewModel.studentPasswordController,
        validator: (value) =>
            value!.isValidPasswords ? null : 'Min 8 characters, 1 uppercase, 1 lowercase, 1 number',
        obscureText: viewModel.isLock,
        decoration: InputDecoration(
          labelText: LocaleKeys.login_password.tr(),
          suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                viewModel.isLockStateChange();
              },
              icon: Observer(builder: (_) {
                return Icon(viewModel.isLock ? FontAwesomeIcons.lock : FontAwesomeIcons.lockOpen);
              })),
        ),
      );
    });
  }

  TextFormField buildTextFormFieldName(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: DefaultTabController.of(context)!.index == 0
          ? viewModel.teacherNameController
          : viewModel.studentNameController,
      validator: (value) => value!.isValidNames ? null : 'Name does not valid',
      decoration: InputDecoration(
        labelText: LocaleKeys.login_name.tr(),
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: DefaultTabController.of(context)!.index == 0
          ? viewModel.teacherEmailController
          : viewModel.studentEmailController,
      validator: (value) => value!.isValidEmails ? null : 'Email does not valid',
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
      ),
    );
  }

  Widget buildTextRichForgot(BuildContext context, LoginViewModel viewModel) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => viewModel.sendToForgotPasswordView(
                      DefaultTabController.of(context)!.index == 0 ? 'teacher' : 'student'),
                text: LocaleKeys.login_forgotText.tr(),
                style: TextStyle(
                  color: context.colorSchemeLight.blue,
                ),
              )
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Observer buildTextRichSignUp(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return Text.rich(TextSpan(
        children: [
          TextSpan(
              text: LocaleKeys.login_alreadyAccount.tr(),
              style: TextStyle(color: context.colors.onSecondary.withOpacity(0.6))),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => viewModel.isRegisterChange(),
            text: LocaleKeys.login_login.tr(),
            style: TextStyle(
              color: context.colorSchemeLight.blue,
            ),
          )
        ],
      ));
    });
  }

  Observer buildTextRichSignIn(LoginViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return Text.rich(TextSpan(
        children: [
          TextSpan(
              text: LocaleKeys.login_dontAccount.tr(),
              style: TextStyle(color: context.colors.onSecondary.withOpacity(0.6))),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => viewModel.isRegisterChange(),
            text: LocaleKeys.login_signup.tr(),
            style: TextStyle(
              color: context.colorSchemeLight.blue,
            ),
          )
        ],
      ));
    });
  }

  Widget buildElevatedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                if (DefaultTabController.of(context)!.index == 0) {
                  viewModel.fetchLoginSevice('teacher');
                } else {
                  viewModel.fetchLoginSevice('student');
                }
              },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: context.colorSchemeLight.blue,
          onPrimary: context.colors.primaryContainer,
        ),
        child: Center(
            child: Text(
          LocaleKeys.login_login.tr(),
          style: context.textTheme.headline6!.copyWith(color: context.colors.primaryContainer),
        )),
      );
    });
  }

  Widget buildElevatedButtonRegister(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                if (DefaultTabController.of(context)!.index == 0) {
                  viewModel.fetchRegisterService(context, 'teacher');
                } else {
                  viewModel.fetchRegisterService(context, 'student');
                }
              },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: context.colorSchemeLight.blue,
          onPrimary: context.colors.primaryContainer,
        ),
        child: Center(
            child: Text(
          LocaleKeys.login_signup.tr(),
          style: context.textTheme.headline6!.copyWith(color: context.colors.primaryContainer),
        )),
      );
    });
  }
}
