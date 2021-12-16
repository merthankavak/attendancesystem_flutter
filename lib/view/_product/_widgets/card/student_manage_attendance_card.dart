import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/extension/context_extension.dart';
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
            Text(courseDetailViewModel.courseDetailModel!.students![index].fullName!),
            Spacer(),
            typeOfUser == 'teacher'
                ? courseDetailViewModel
                            .manageAttendanceModels!.studentsArray![index].attendanceStatus ==
                        true
                    ? Icon(Icons.check_box, color: context.colorSchemeLight.green)
                    : Icon(Icons.cancel_outlined, color: context.colorSchemeLight.red)
                : SizedBox(),
            typeOfUser == 'teacher'
                ? Observer(builder: (_) {
                    return IconButton(
                        onPressed: () async {
                          await courseDetailViewModel.showPicker(
                              courseDetailViewModel, context, index);
                        },
                        icon: Icon(Icons.edit));
                  })
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());
}
