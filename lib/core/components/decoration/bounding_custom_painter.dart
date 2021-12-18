import 'package:flutter/material.dart';

import '../../../view/home/course/viewmodel/subviewmodel/course_detail_view_model.dart';

class BoundingCustomPainter extends CustomPainter {
  final CourseDetailViewModel viewModel;
  final int index;

  BoundingCustomPainter({
    required this.viewModel,
    required this.index,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(
          double.parse(
              viewModel.manageAttendanceModels!.studentsArray![index].boundingBoxModel!.left!),
          double.parse(
              viewModel.manageAttendanceModels!.studentsArray![index].boundingBoxModel!.top!),
          double.parse(
              viewModel.manageAttendanceModels!.studentsArray![index].boundingBoxModel!.width!),
          double.parse(
              viewModel.manageAttendanceModels!.studentsArray![index].boundingBoxModel!.height!),
        ),
        Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(BoundingCustomPainter oldDelegate) {
    return false;
  }
}
