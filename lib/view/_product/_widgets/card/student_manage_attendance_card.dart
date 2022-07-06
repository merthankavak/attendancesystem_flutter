import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/course/viewmodel/subviewmodel/course_detail_view_model.dart';

class StudentManageAttendanceCard extends StatelessWidget {
  final CourseDetailViewModel courseDetailViewModel;
  final String typeOfUser;
  final int index;
  const StudentManageAttendanceCard(
      {Key? key,
      required this.courseDetailViewModel,
      required this.typeOfUser,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: buildClipOval(context)),
            const Spacer(flex: 1),
            Expanded(flex: 3, child: buildFullNameText(context)),
            Expanded(
                flex: 3,
                child: courseDetailViewModel
                                .manageAttendanceModels!.studentsArray![index].confidence ==
                            null ||
                        courseDetailViewModel
                                .manageAttendanceModels!.studentsArray![index].confidence ==
                            ''
                    ? const SizedBox()
                    : Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: '${LocaleKeys.course_teacher_attendance_accuracy.tr()}: '),
                            TextSpan(
                                text:
                                    '${courseDetailViewModel.manageAttendanceModels!.studentsArray![index].confidence!}%')
                          ],
                        ),
                        textAlign: TextAlign.center)),
            Expanded(
              flex: 1,
              child: typeOfUser == 'teacher'
                  ? courseDetailViewModel
                              .manageAttendanceModels!.studentsArray![index].attendanceStatus ==
                          'true'
                      ? Icon(Icons.check_box, color: context.colorSchemeLight.green)
                      : Icon(Icons.cancel_outlined, color: context.colorSchemeLight.red)
                  : const SizedBox(),
            ),
            typeOfUser == 'teacher'
                ? Expanded(flex: 1, child: buildObserverEdit(context))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Observer buildObserverEdit(BuildContext context) {
    return Observer(builder: (_) {
      return IconButton(
          onPressed: () async {
            await courseDetailViewModel.showPicker(courseDetailViewModel, context, index);
          },
          icon: const Icon(Icons.edit));
    });
  }

  Text buildFullNameText(BuildContext context) {
    return Text(
      courseDetailViewModel.courseDetailModel!.students![index].fullName!,
      style: Theme.of(context).textTheme.bodyText2!,
    );
  }

  FullScreenWidget buildClipOval(BuildContext context) {
    return FullScreenWidget(
      child: Hero(
        tag: courseDetailViewModel.courseDetailModel!.students![index].id!,
        child: ClipOval(
          child: Image(
              fit: BoxFit.fill,
              height: context.height * 0.06,
              width: context.width * 0.06,
              image: CachedNetworkImageProvider(
                courseDetailViewModel.courseDetailModel!.students![index].imageUrl!,
              )),
        ),
      ),
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());
}
