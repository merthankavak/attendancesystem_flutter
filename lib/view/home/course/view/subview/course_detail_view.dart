import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../viewmodel/course_view_model.dart';

class CourseDetailView extends StatelessWidget {
  final String typeOfUser;
  final String courseId;
  const CourseDetailView({Key? key, required this.typeOfUser, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseViewModel>(
      viewModel: CourseViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CourseViewModel viewModel) => Scaffold(),
    );
  }
}
