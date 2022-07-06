import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/button/title_text_button.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/extension/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../viewmodel/subviewmodel/course_detail_view_model.dart';

class CourseScheduleView extends StatelessWidget {
  final String typeOfUser;
  final String courseId;

  const CourseScheduleView({Key? key, required this.typeOfUser, required this.courseId})
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
        key: viewModel.courseScheduleViewScaffoldKey,
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.courseDetailModel == null
                  ? const Center(child: Text('Not Found'))
                  : SingleChildScrollView(
                      padding: context.paddingBitNormal,
                      child: buildCourseScheduleForm(viewModel, context));
        }),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  Form buildCourseScheduleForm(CourseDetailViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.courseScheduleFormKey,
      child: Column(
        children: <Widget>[
          buildTextFormFieldCourseStartDate(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseEndDate(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseStartTime(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseEndTime(viewModel),
          context.emptySizedHeightBoxNormal,
          buildElevatedButtonCourseSchedule(context, viewModel),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldCourseStartDate(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseStartDateController,
      validator: (value) => value!.isValidCourseDates && value.isNotEmpty
          ? null
          : 'Course start date does not valid!',
      decoration: InputDecoration(
          labelText: LocaleKeys.course_teacher_schedule_courseStartDate.tr(),
          hintText: 'DD-MM-YYYY'),
    );
  }

  TextFormField buildTextFormFieldCourseEndDate(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseEndDateController,
      validator: (value) =>
          value!.isValidCourseDates && value.isNotEmpty ? null : 'Course end date does not valid!',
      decoration: InputDecoration(
          labelText: LocaleKeys.course_teacher_schedule_courseEndDate.tr(), hintText: 'DD-MM-YYYY'),
    );
  }

  TextFormField buildTextFormFieldCourseStartTime(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseStartTimeController,
      validator: (value) => value!.isValidCourseTimes && value.isNotEmpty
          ? null
          : 'Course start time does not valid!',
      decoration: InputDecoration(
          labelText: LocaleKeys.course_teacher_schedule_courseStartTime.tr(), hintText: 'HH:MM'),
    );
  }

  TextFormField buildTextFormFieldCourseEndTime(CourseDetailViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseEndTimeController,
      validator: (value) => value!.isValidCourseTimes ? null : 'Course end time does not valid!',
      decoration: InputDecoration(
          labelText: LocaleKeys.course_teacher_schedule_courseEndTime.tr(), hintText: 'HH:MM'),
    );
  }

  Widget buildElevatedButtonCourseSchedule(BuildContext context, CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: () {
            viewModel.addCourseSchedule(courseId, typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.course_teacher_schedule_button.tr(),
                  style: context.theme.textTheme.subtitle1!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }
}
