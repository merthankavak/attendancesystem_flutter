import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        padding: context.paddingBitNormal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 10,
                child: Image(
                    image: CachedNetworkImageProvider(
                  courseDetailViewModel.courseDetailModel!.students![index].imageUrl!,
                ))),
            Spacer(flex: 5),
            Expanded(
                flex: 30,
                child: Text(
                  courseDetailViewModel.courseDetailModel!.students![index].fullName!,
                  style: Theme.of(context).textTheme.bodyText2!,
                )),
            Expanded(
                flex: 20,
                child: courseDetailViewModel
                            .manageAttendanceModels!.studentsArray![index].confidence ==
                        ''
                    ? SizedBox()
                    : Text(LocaleKeys.course_teacher_attendance_accuracy.tr() + ': ')),
            Expanded(
              flex: 20,
              child:
                  courseDetailViewModel.manageAttendanceModels!.studentsArray![index].confidence ==
                          ''
                      ? SizedBox()
                      : Text(courseDetailViewModel
                              .manageAttendanceModels!.studentsArray![index].confidence! +
                          '%'),
            ),
            Expanded(
              flex: 10,
              child: typeOfUser == 'teacher'
                  ? courseDetailViewModel
                              .manageAttendanceModels!.studentsArray![index].attendanceStatus ==
                          'true'
                      ? Icon(Icons.check_box, color: context.colorSchemeLight.green)
                      : Icon(Icons.cancel_outlined, color: context.colorSchemeLight.red)
                  : SizedBox(),
            ),
            Expanded(
                flex: 10,
                child: typeOfUser == 'teacher'
                    ? Observer(builder: (_) {
                        return IconButton(
                            onPressed: () async {
                              await courseDetailViewModel.showPicker(
                                  courseDetailViewModel, context, index);
                            },
                            icon: Icon(Icons.edit));
                      })
                    : SizedBox())
          ],
        ),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());
}
