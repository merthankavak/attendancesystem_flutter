import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/course/model/submodel/course/course_model.dart';

class CourseDetailCard extends StatelessWidget {
  final CourseModel courseModel;
  final String typeOfUser;

  const CourseDetailCard({
    Key? key,
    required this.courseModel,
    required this.typeOfUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.normalCircularRadius),
      margin: context.paddingLow,
      child: Padding(
        padding: context.paddingLow,
        child: buildCourseDetailColumn(context),
      ),
    );
  }

  Column buildCourseDetailColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 15,
          child: Text(courseModel.courseShortName!, style: Theme.of(context).textTheme.headline6!),
        ),
        const Spacer(flex: 10),
        Expanded(
          flex: 15,
          child: Text(courseModel.courseName!, style: Theme.of(context).textTheme.subtitle2!),
        ),
        const Spacer(flex: 10),
        Expanded(
          flex: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [],
          ),
        ),
        const Spacer(flex: 10),
        Expanded(
            flex: 20,
            child: Text(
                '${LocaleKeys.course_teacher_teacher.tr()} : ${courseModel.teacher!.fullName!}',
                style: Theme.of(context).textTheme.subtitle2!)),
      ],
    );
  }
}
