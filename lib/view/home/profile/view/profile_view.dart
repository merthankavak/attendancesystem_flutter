// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/theme/light/color_scheme_light.dart';
import '../../../menu/view/menu_view.dart';
import '../viewmodel/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  final String typeOfUser;
  const ProfileView({Key? key, required this.typeOfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getUserInformation(typeOfUser);
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) => Scaffold(
        key: viewModel.profileScaffoldKey,
        appBar: buildAppBar(context, viewModel),
        drawer: const MenuView(),
        body: Observer(
          builder: (_) {
            return viewModel.isLoading ? buildCenter() : buildUserColumn(context, viewModel);
          },
        ),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, ProfileViewModel viewModel) {
    return AppBar(
      title: Text(LocaleKeys.profile_appbar.tr()),
      leading: IconButton(
        onPressed: () {
          viewModel.profileScaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
    );
  }

  Column buildUserColumn(BuildContext context, ProfileViewModel viewModel) {
    return Column(
      children: <Widget>[
        Expanded(flex: 20, child: buildUserContainer(context, viewModel)),
        Expanded(flex: 80, child: buildSingleChildScrollView(context, viewModel))
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
          BuildContext context, ProfileViewModel viewModel) =>
      SingleChildScrollView(child: buildProfileDetailContainer(context, viewModel));

  Container buildProfileDetailContainer(BuildContext context, ProfileViewModel viewModel) {
    return Container(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.profile_account_title.tr(),
            style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600),
          ),
          Divider(color: ColorSchemeLight.instance!.black),
          Card(
            color: context.colorScheme.primaryContainer,
            child: Column(
              children: [
                typeOfUser == 'student' ? buildProfilePhotoListTile(viewModel) : const SizedBox(),
                buildUsernameChangeListTile(context, viewModel),
                buildPasswordChangeListTile(context, viewModel),
              ],
            ),
          ),
          Divider(color: ColorSchemeLight.instance!.black),
          Card(
            color: context.colorScheme.primaryContainer,
            child: buildLogOutListTile(context, viewModel),
          ),
        ],
      ),
    );
  }

  ListTile buildUsernameChangeListTile(BuildContext context, ProfileViewModel viewModel) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.idBadge),
      title: Text(LocaleKeys.profile_account_fullNameTitle.tr()),
      subtitle: Text(LocaleKeys.profile_account_fullNameDesc.tr()),
      onTap: () {
        showModalBottomSheetFullName(context, viewModel);
      },
    );
  }

  ListTile buildPasswordChangeListTile(BuildContext context, ProfileViewModel viewModel) {
    return ListTile(
      leading: const Icon(Icons.password_rounded),
      title: Text(LocaleKeys.profile_account_passwordTitle.tr()),
      subtitle: Text(LocaleKeys.profile_account_passwordDesc.tr()),
      onTap: () {
        showModalBottomSheetPassword(context, viewModel);
      },
    );
  }

  ListTile buildLogOutListTile(BuildContext context, ProfileViewModel viewModel) {
    return ListTile(
      leading: const Icon(Icons.exit_to_app),
      title: Text(LocaleKeys.profile_exit_logout.tr()),
      onTap: () {
        viewModel.logutApp();
      },
    );
  }

  ListTile buildProfilePhotoListTile(ProfileViewModel viewModel) {
    return ListTile(
      leading: const Icon(Icons.photo),
      title: Text(LocaleKeys.profile_account_photoTitle.tr()),
      subtitle: Text(LocaleKeys.profile_account_photoDesc.tr()),
      onTap: () async {
        await ImagePickers.pickerPaths(
                galleryMode: GalleryMode.image,
                selectCount: 1,
                showCamera: true,
                showGif: false,
                compressSize: 50,
                cropConfig: CropConfig(enableCrop: true, width: 1024, height: 1024))
            .then((value) async =>
                await viewModel.updateStudentProfilePicture(typeOfUser, value.first));
      },
    );
  }

  Card buildUserContainer(BuildContext context, ProfileViewModel viewModel) {
    return Card(
      margin: context.paddingLow,
      color: context.colorScheme.primaryContainer,
      child: Padding(
        padding: context.paddingNormal,
        child: Row(
          children: <Widget>[
            typeOfUser == 'teacher'
                ? Expanded(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: ColorSchemeLight.instance!.transparent,
                        radius: 30,
                        child: Text(viewModel.teacherModel!.fullName.toString().characters.first)))
                : viewModel.studentModel!.imageUrl == null
                    ? Expanded(
                        flex: 1,
                        child: CircleAvatar(
                            backgroundColor: ColorSchemeLight.instance!.black,
                            radius: 30,
                            child:
                                Text(viewModel.studentModel!.fullName.toString().characters.first)))
                    : Expanded(
                        flex: 1,
                        child: FullScreenWidget(
                          child: Hero(
                            tag: viewModel.studentModel!.id!,
                            child: ClipOval(
                              child: Image(
                                  fit: BoxFit.fill,
                                  height: context.height * 0.06,
                                  width: context.width * 0.06,
                                  image: CachedNetworkImageProvider(
                                      viewModel.studentModel!.imageUrl!)),
                            ),
                          ),
                        )),
            const Spacer(flex: 1),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(TextSpan(children: [
                    typeOfUser == 'teacher'
                        ? TextSpan(
                            text: viewModel.teacherModel!.fullName,
                            style: context.textTheme.subtitle1!)
                        : TextSpan(
                            text: viewModel.studentModel!.fullName,
                            style: context.textTheme.subtitle1!),
                  ])),
                  Text.rich(TextSpan(children: [
                    typeOfUser == 'teacher'
                        ? TextSpan(
                            text: viewModel.teacherModel!.email,
                            style: context.appTheme.textTheme.subtitle2!)
                        : TextSpan(
                            text: viewModel.studentModel!.email,
                            style: context.textTheme.subtitle2!),
                  ])),
                ],
              ),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }

  Form buildChangeFullNameForm(ProfileViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: typeOfUser == 'teacher'
          ? viewModel.profileTeacherChangeUsernameFormKey
          : viewModel.profileStudentChangeUsernameFormKey,
      child: Column(
        children: <Widget>[
          context.emptySizedHeightBoxNormal,
          Text(LocaleKeys.profile_account_fullName.tr(),
              style: Theme.of(context).textTheme.subtitle1!),
          context.emptySizedHeightBoxNormal,
          buildTextFormFieldFullName(viewModel),
          context.emptySizedHeightBoxNormal,
          buildElevatedButtonFullNameConfirm(context, viewModel)
        ],
      ),
    );
  }

  Form buildChangePasswordForm(ProfileViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: typeOfUser == 'teacher'
          ? viewModel.profileTeacherChangePasswordFormKey
          : viewModel.profileStudentChangePasswordFormKey,
      child: Column(
        children: <Widget>[
          context.emptySizedHeightBoxNormal,
          Text(LocaleKeys.changepassword_password.tr(),
              style: Theme.of(context).textTheme.subtitle1!),
          context.emptySizedHeightBoxNormal,
          buildTextFormFieldPassword(viewModel),
          context.emptySizedHeightBoxNormal,
          buildElevatedButtonPasswordConfirm(context, viewModel)
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldFullName(ProfileViewModel viewModel) {
    return TextFormField(
      controller: viewModel.fullNameController,
      validator: (value) => value!.isNotEmpty ? null : 'Full name does not valid!',
      decoration: InputDecoration(labelText: LocaleKeys.profile_account_fullName.tr()),
    );
  }

  TextFormField buildTextFormFieldPassword(ProfileViewModel viewModel) {
    return TextFormField(
      controller: viewModel.passwordController,
      validator: (value) =>
          value!.isValidPasswords ? null : 'Min 8 characters, 1 uppercase, 1 lowercase, 1 number',
      decoration: InputDecoration(
          labelText: LocaleKeys.profile_account_password.tr(),
          prefixIcon: const Icon(Icons.password)),
    );
  }

  TextFormField buildTextFormFieldConfirmPassword(ProfileViewModel viewModel) {
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
          labelText: LocaleKeys.profile_account_confirmPassword.tr(),
          prefixIcon: const Icon(Icons.password)),
    );
  }

  Widget buildTextRichChangePassword(BuildContext context, ProfileViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.profile_account_passwordTitle.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.onPrimary),
              ),
              TextSpan(
                text: LocaleKeys.profile_account_passwordDesc.tr(),
                style: Theme.of(context).textTheme.subtitle1!,
              )
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget buildTextRichChangeFullName(BuildContext context, ProfileViewModel viewModel) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.profile_account_fullNameTitle.tr(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.onPrimary),
              ),
              TextSpan(
                text: LocaleKeys.profile_account_fullNameDesc.tr(),
                style: Theme.of(context).textTheme.subtitle1!,
              )
            ],
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget buildElevatedButtonPasswordConfirm(BuildContext context, ProfileViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: viewModel.isLoading
              ? null
              : () {
                  viewModel.changePassword(context, typeOfUser);
                },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: ColorSchemeLight.instance!.blue,
            onPrimary: context.colorScheme.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.profile_account_button.tr(),
                  style: context.textTheme.subtitle1!
                      .copyWith(color: ColorSchemeLight.instance!.white))));
    });
  }

  Widget buildElevatedButtonFullNameConfirm(BuildContext context, ProfileViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: viewModel.isLoading
              ? null
              : () {
                  typeOfUser == 'teacher'
                      ? viewModel.updateTeacherFullName(typeOfUser)
                      : viewModel.updateStudentFullName(typeOfUser);
                },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: ColorSchemeLight.instance!.blue,
            onPrimary: context.colorScheme.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.profile_account_button.tr(),
                  style: context.textTheme.subtitle1!
                      .copyWith(color: ColorSchemeLight.instance!.white))));
    });
  }

  Future<dynamic> showModalBottomSheetPassword(BuildContext context, ProfileViewModel viewModel) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              expand: true,
              minChildSize: 0.3,
              maxChildSize: 1,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  padding: context.paddingNormal,
                  child: buildChangePasswordForm(viewModel, context),
                );
              });
        });
  }

  Future<dynamic> showModalBottomSheetFullName(BuildContext context, ProfileViewModel viewModel) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              expand: true,
              minChildSize: 0.3,
              maxChildSize: 1,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  padding: context.paddingNormal,
                  child: buildChangeFullNameForm(viewModel, context),
                );
              });
        });
  }
}
