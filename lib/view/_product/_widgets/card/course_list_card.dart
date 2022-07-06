import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/course/model/submodel/course/course_model.dart';
import '../../../home/course/viewmodel/course_view_model.dart';

class CourseListCard extends StatelessWidget {
  final CourseViewModel courseViewModel;
  final List<CourseModel> courseList;
  final int itemIndex;
  final String typeOfUser;

  const CourseListCard({
    Key? key,
    required this.courseViewModel,
    required this.courseList,
    required this.itemIndex,
    required this.typeOfUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return buildRow(context);
    });
  }

  Row buildRow(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 9, child: buildInkwell(context)),
        Expanded(flex: 1, child: buildIconButtonColumn(context)),
      ],
    );
  }

  InkWell buildInkwell(BuildContext context) {
    return InkWell(
      onTap: () {
        courseViewModel.sendCourseDetailView(
            typeOfUser, courseViewModel.courseList![itemIndex].id!);
      },
      child: Padding(padding: context.paddingBitNormal, child: buildCourseInfoColumn(context)),
    );
  }

  Column buildCourseInfoColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(courseList[itemIndex].courseShortName!,
              style: Theme.of(context).textTheme.headline6!),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: Text(courseList[itemIndex].courseName!,
              style: Theme.of(context).textTheme.subtitle1!),
        ),
        const Spacer(flex: 3),
        Expanded(
          flex: 2,
          child: Text(
              '${LocaleKeys.course_teacher_teacher.tr()} : ${courseList[itemIndex].teacher!.fullName!}',
              style: Theme.of(context).textTheme.subtitle1!),
        ),
      ],
    );
  }

  Column buildIconButtonColumn(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              buildShowModalBottomSheet(context);
            },
            icon: const Icon(Icons.more_vert_rounded)),
      ],
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return buildModalBottomSheetColumn();
        });
  }

  Column buildModalBottomSheetColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        typeOfUser == 'student'
            ? ListTile(
                leading: const Icon(FontAwesomeIcons.signOutAlt),
                title: Text(LocaleKeys.course_student_unenroll.tr()),
                onTap: () {
                  courseViewModel.leaveCourse(courseList[itemIndex].id!, typeOfUser);
                },
              )
            : ListTile(
                leading: const Icon(Icons.delete),
                title: Text(LocaleKeys.course_teacher_delete.tr()),
                onTap: () {
                  courseViewModel.deleteCourse(courseList[itemIndex].id!, typeOfUser);
                },
              ),
        typeOfUser == 'teacher'
            ? ListTile(
                leading: const Icon(Icons.share_outlined),
                title: Text(LocaleKeys.course_teacher_share.tr()),
                onTap: () {
                  Share.share(courseList[itemIndex].courseCode!);
                },
              )
            : const SizedBox(),
      ],
    );
  }
}
