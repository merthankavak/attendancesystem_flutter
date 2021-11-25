import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../home/course/viewmodel/subviewmodel/course_detail_view_model.dart';

class StudentCard extends StatelessWidget {
  final CourseDetailViewModel courseDetailViewModel;
  final String typeOfUser;
  final int index;
  const StudentCard(
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
            Text(courseDetailViewModel.courseDetailModel!.students![index].email!),
            CircleAvatar(child: ClipRect()),
          ],
        ),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());
}
