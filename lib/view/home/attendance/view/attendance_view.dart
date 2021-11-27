import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../course/viewmodel/subviewmodel/course_detail_view_model.dart';

class AttendanceView extends StatelessWidget {
  final String typeOfUser;
  final String courseId;
  final String date;
  const AttendanceView(
      {Key? key, required this.typeOfUser, required this.courseId, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseDetailViewModel>(
      viewModel: CourseDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CourseDetailViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading ? buildCenter() : Text('data');
        }),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, CourseDetailViewModel viewModel) {
    return AppBar(
      title: Text(date),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(FontAwesomeIcons.arrowLeft),
      ),
    );
  }

  Widget buildStudentListView(CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            Padding(padding: context.paddingLowHorizontal, child: Card(child: Text('data'))),
      );
    });
  }
}
