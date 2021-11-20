import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/course/model/submodel/course/course_model.dart';
import '../../../home/course/viewmodel/course_view_model.dart';

class CourseListCard extends StatelessWidget {
  final CourseViewModel courseViewModel;
  final List<CourseModel> courseList;
  final int itemIndex;
  final String typeOfUser;

  const CourseListCard(
      {Key? key,
      required this.courseViewModel,
      required this.courseList,
      required this.itemIndex,
      required this.typeOfUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Padding(
            padding: context.paddingBitNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(courseList[itemIndex].courseShortName!,
                      style: Theme.of(context).textTheme.headline6!),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Text(courseList[itemIndex].courseName!,
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
                Spacer(flex: 3),
                Expanded(
                  flex: 2,
                  child: Text(
                      LocaleKeys.course_teacher_teacher.tr() +
                          ' : ' +
                          courseList[itemIndex].teacher!.fullName!,
                      style: Theme.of(context).textTheme.subtitle1!),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                typeOfUser == 'student'
                                    ? ListTile(
                                        leading: Icon(FontAwesomeIcons.signOutAlt),
                                        title: Text(LocaleKeys.course_student_unenroll.tr()),
                                        onTap: () {
                                          courseViewModel.leaveCourse(
                                              courseList[itemIndex].id!, typeOfUser);
                                        },
                                      )
                                    : ListTile(
                                        leading: Icon(Icons.delete),
                                        title: Text(LocaleKeys.course_teacher_delete.tr()),
                                        onTap: () {
                                          courseViewModel.deleteCourse(
                                              courseList[itemIndex].id!, typeOfUser);
                                        },
                                      ),
                                typeOfUser == 'teacher'
                                    ? ListTile(
                                        leading: Icon(Icons.share_outlined),
                                        title: Text(LocaleKeys.course_teacher_share.tr()),
                                        onTap: () {
                                          Share.share(courseList[itemIndex].courseCode!);
                                        },
                                      )
                                    : SizedBox(),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.more_vert_rounded)),
              ],
            )),
      ],
    );
  }
}
