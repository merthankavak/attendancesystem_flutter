import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/button/title_text_button.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../viewmodel/subviewmodel/course_detail_view_model.dart';

class CourseDetailSettingsView extends StatelessWidget {
  final String typeOfUser;
  final String courseId;

  const CourseDetailSettingsView({Key? key, required this.typeOfUser, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseDetailViewModel>(
      viewModel: CourseDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getCourseDetail(typeOfUser, courseId);
      },
      onPageBuilder: (BuildContext context, CourseDetailViewModel viewModel) => Scaffold(
        key: viewModel.detailSettingsScaffoldKey,
        appBar: buildAppBar(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.courseDetailModel == null
                  ? const Center(child: Text('Not Found'))
                  : SingleChildScrollView(
                      padding: context.paddingBitNormal,
                      child: buildCourseSettingsForm(viewModel, context));
        }),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, CourseDetailViewModel viewModel) {
    return AppBar(
      title: Text(LocaleKeys.course_teacher_settings_title.tr()),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(FontAwesomeIcons.arrowLeft),
      ),
    );
  }

  Form buildCourseSettingsForm(CourseDetailViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.courseUpdateFormKey,
      child: Column(
        children: <Widget>[
          buildTextFormFieldCourseShortName(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseName(viewModel),
          context.emptySizedHeightBoxNormal,
          buildElevatedButtonCourseSettings(context, viewModel),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldCourseShortName(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseShortNameController,
      validator: (value) => value!.isNotEmpty ? null : 'Course short name does not valid!',
      decoration:
          InputDecoration(labelText: LocaleKeys.course_teacher_settings_coursenShortNameHint.tr()),
    );
  }

  TextFormField buildTextFormFieldCourseName(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseNameController,
      validator: (value) => value!.isNotEmpty ? null : 'Course name does not valid!',
      decoration:
          InputDecoration(labelText: LocaleKeys.course_teacher_settings_coursenNameHint.tr()),
    );
  }

  Widget buildElevatedButtonCourseSettings(BuildContext context, CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: () {
            viewModel.updateCourse(courseId, typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.course_teacher_settings_button.tr(),
                  style: context.theme.textTheme.subtitle1!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }
}
