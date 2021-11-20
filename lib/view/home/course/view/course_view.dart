import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/card/course_list_card.dart';
import '../viewmodel/course_view_model.dart';

class CourseView extends StatelessWidget {
  final String typeOfUser;
  const CourseView({Key? key, required this.typeOfUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseViewModel>(
      viewModel: CourseViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getCoursesList(typeOfUser);
      },
      onPageBuilder: (BuildContext context, CourseViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(context, viewModel),
        floatingActionButton: buildFloatingActionButton(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.courseListModel == null
                  ? Center(child: Text('Not Found'))
                  : buildListView(viewModel);
        }),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());

  Observer buildListView(CourseViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.courseList!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: context.paddingOnlyList,
          child: Container(
              height: context.veryhighValue,
              decoration: viewModel.helper.boxDecorationAll,
              child: buildObserverCard(viewModel, index)),
        ),
      );
    });
  }

  Observer buildObserverCard(CourseViewModel viewModel, int index) {
    return Observer(builder: (_) {
      return CourseListCard(
        courseViewModel: viewModel,
        courseList: viewModel.courseList!,
        itemIndex: index,
        typeOfUser: typeOfUser,
      );
    });
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context, CourseViewModel viewModel) {
    return FloatingActionButton(
      onPressed: () {
        if (typeOfUser == 'teacher') {
          showModalBottomSheetTeacher(context, viewModel);
        } else {
          showModalBottomSheetStudent(context, viewModel);
        }
      },
      tooltip: typeOfUser == 'teacher'
          ? LocaleKeys.course_teacher_tooltip.tr()
          : LocaleKeys.course_student_tooltip.tr(),
      child: typeOfUser == 'teacher'
          ? Icon(Icons.add, color: context.colorSchemeLight.white)
          : Icon(FontAwesomeIcons.arrowRight, color: context.colorSchemeLight.white),
    );
  }

  Future<dynamic> showModalBottomSheetStudent(BuildContext context, CourseViewModel viewModel) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: context.normalCircularRadius),
        builder: (context) {
          return Container(
              height: context.height * 0.90,
              child: Column(
                children: [
                  Spacer(flex: 5),
                  Expanded(
                      flex: 10,
                      child: Text(LocaleKeys.course_student_title.tr(),
                          style: Theme.of(context).textTheme.subtitle1!)),
                  Expanded(flex: 85, child: buildStudentForm(viewModel, context)),
                ],
              ));
        });
  }

  Future<dynamic> showModalBottomSheetTeacher(BuildContext context, CourseViewModel viewModel) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: context.normalCircularRadius),
        builder: (context) {
          return Container(
            height: context.height * 0.90,
            child: Column(
              children: [
                Spacer(flex: 5),
                Expanded(
                    flex: 10,
                    child: Text(LocaleKeys.course_teacher_title.tr(),
                        style: Theme.of(context).textTheme.subtitle1!)),
                Expanded(flex: 85, child: buildTeacherForm(viewModel, context)),
              ],
            ),
          );
        });
  }

  AppBar buildAppBar(BuildContext context, CourseViewModel viewModel) {
    return AppBar(
        title: Text(LocaleKeys.course_title.tr()),
        leading: IconButton(
          onPressed: () {
            //viewModel.menu();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //viewModel.profile();
              },
              icon: Icon(FontAwesomeIcons.user))
        ]);
  }

  Form buildStudentForm(CourseViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.floatingActionFormStudent,
      child: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTextFormFieldCourseCode(viewModel, context),
            Spacer(flex: 1),
            buildTextRichStudentJoinCourse(context, viewModel),
            Spacer(flex: 1),
            buildElevatedButtonStudentJoinCourse(context, viewModel),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  Form buildTeacherForm(CourseViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.floatingActionFormTeacher,
      child: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTextFormFieldCourseName(viewModel),
            Spacer(flex: 1),
            buildTextFormFieldCourseShortName(viewModel),
            Spacer(flex: 1),
            buildTextRichTeacherCreateCourse(context, viewModel),
            Spacer(flex: 1),
            buildElevatedButtonTeacherCreateCourse(context, viewModel),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldCourseName(CourseViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseNameController,
      validator: (value) => value!.isNotEmpty ? null : 'Course name does not valid!',
      decoration: InputDecoration(labelText: LocaleKeys.course_teacher_coursenNameHint.tr()),
    );
  }

  TextFormField buildTextFormFieldCourseShortName(CourseViewModel viewModel) {
    return TextFormField(
      controller: viewModel.courseShortNameController,
      validator: (value) => value!.isNotEmpty ? null : 'Course short name does not valid!',
      decoration: InputDecoration(labelText: LocaleKeys.course_teacher_coursenShortNameHint.tr()),
    );
  }

  TextFormField buildTextFormFieldCourseCode(CourseViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.courseCodeController,
      validator: (value) => value!.isNotEmpty ? null : 'Course code does not valid!',
      decoration: InputDecoration(
        labelText: LocaleKeys.course_student_hint.tr(),
      ),
    );
  }

  Widget buildElevatedButtonStudentJoinCourse(BuildContext context, CourseViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: () {
            viewModel.floatingButtonControl(typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryVariant,
          ),
          child: Center(
              child: Text(LocaleKeys.course_student_button.tr(),
                  style: context.textTheme.subtitle1!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }

  Widget buildElevatedButtonTeacherCreateCourse(BuildContext context, CourseViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: () {
            viewModel.floatingButtonControl(typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: context.colorSchemeLight.blue,
            onPrimary: context.colors.primaryVariant,
          ),
          child: Center(
              child: Text(LocaleKeys.course_teacher_button.tr(),
                  style: context.textTheme.subtitle1!
                      .copyWith(color: context.colorSchemeLight.white))));
    });
  }

  Widget buildTextRichStudentJoinCourse(BuildContext context, CourseViewModel viewModel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: LocaleKeys.course_student_desc_title.tr() + '\n\n',
                  style: Theme.of(context).textTheme.subtitle1!),
              TextSpan(
                  text: LocaleKeys.course_student_desc_desc1.tr() + '\n',
                  style: Theme.of(context).textTheme.subtitle2!),
              TextSpan(
                  text: LocaleKeys.course_student_desc_desc2.tr(),
                  style: Theme.of(context).textTheme.subtitle2!)
            ],
          ),
          textAlign: TextAlign.left),
    );
  }

  Widget buildTextRichTeacherCreateCourse(BuildContext context, CourseViewModel viewModel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: LocaleKeys.course_teacher_desc_title.tr() + '\n\n',
                  style: Theme.of(context).textTheme.subtitle1!),
              TextSpan(
                  text: LocaleKeys.course_teacher_desc_desc1.tr(),
                  style: Theme.of(context).textTheme.subtitle2!)
            ],
          ),
          textAlign: TextAlign.left),
    );
  }
}
