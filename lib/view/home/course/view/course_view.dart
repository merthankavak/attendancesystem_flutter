import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/title_text_button.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/card/course_list_card.dart';
import '../../../menu/view/menu_view.dart';
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
        model.getUserInformation(typeOfUser);
      },
      onPageBuilder: (BuildContext context, CourseViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(context, viewModel),
        drawer: const MenuView(),
        floatingActionButton: buildFloatingActionButton(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.courseList == null
                  ? const Center(child: Text('Not Found'))
                  : buildListView(viewModel);
        }),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  Observer buildListView(CourseViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.courseList!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: context.paddingLow,
          child: Container(
              height: context.height * 0.2,
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
          typeOfUser: typeOfUser);
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
          ? const Icon(Icons.add, color: Colors.white)
          : const Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
    );
  }

  Future<dynamic> showModalBottomSheetStudent(BuildContext context, CourseViewModel viewModel) {
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
                  padding: context.paddingNormal, child: buildStudentForm(viewModel, context));
            },
          );
        });
  }

  Future<dynamic> showModalBottomSheetTeacher(BuildContext context, CourseViewModel viewModel) {
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
                  child: buildTeacherForm(viewModel, context),
                );
              });
        });
  }

  AppBar buildAppBar(BuildContext context, CourseViewModel viewModel) {
    return AppBar(
        title: Text(LocaleKeys.course_title.tr()),
        leading: IconButton(
          onPressed: () {
            viewModel.scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.sendProfileView(typeOfUser);
              },
              icon: const Icon(FontAwesomeIcons.user))
        ]);
  }

  Form buildStudentForm(CourseViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.floatingActionFormStudent,
      child: Column(
        children: <Widget>[
          context.emptySizedHeightBoxLow3x,
          Text(LocaleKeys.course_student_title.tr(), style: Theme.of(context).textTheme.subtitle1!),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseCode(viewModel, context),
          context.emptySizedHeightBoxLow3x,
          buildTextRichStudentJoinCourse(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          buildElevatedButtonStudentJoinCourse(context, viewModel),
        ],
      ),
    );
  }

  Form buildTeacherForm(CourseViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.floatingActionFormTeacher,
      child: Column(
        children: <Widget>[
          context.emptySizedHeightBoxLow3x,
          Text(LocaleKeys.course_teacher_title.tr(), style: Theme.of(context).textTheme.subtitle1!),
          buildTextFormFieldCourseName(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextFormFieldCourseShortName(viewModel),
          context.emptySizedHeightBoxLow3x,
          buildTextRichTeacherCreateCourse(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          buildElevatedButtonTeacherCreateCourse(context, viewModel),
        ],
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
            viewModel.floatingButtonControl(context, typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.blue,
            onPrimary: context.appTheme.colorScheme.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.course_student_button.tr(),
                  style: context.textTheme.subtitle1!.copyWith(color: Colors.white))));
    });
  }

  Widget buildElevatedButtonTeacherCreateCourse(BuildContext context, CourseViewModel viewModel) {
    return Observer(builder: (_) {
      return TitleTextButton(
          onPressed: () {
            viewModel.floatingButtonControl(context, typeOfUser);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.blue,
            onPrimary: context.appTheme.colorScheme.primaryContainer,
          ),
          child: Center(
              child: Text(LocaleKeys.course_teacher_button.tr(),
                  style: context.textTheme.subtitle1!.copyWith(color: Colors.white))));
    });
  }

  Widget buildTextRichStudentJoinCourse(BuildContext context, CourseViewModel viewModel) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${LocaleKeys.course_student_desc_title.tr()}\n\n',
                  style: Theme.of(context).textTheme.subtitle1!),
              TextSpan(
                  text: '${LocaleKeys.course_student_desc_desc1.tr()}\n',
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
                  text: '${LocaleKeys.course_teacher_desc_title.tr()}\n\n',
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
