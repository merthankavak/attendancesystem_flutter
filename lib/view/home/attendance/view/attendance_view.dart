import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/card/student_manage_attendance_card.dart';
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
        model.showAttendanceStatus(date, courseId);
      },
      onPageBuilder: (BuildContext context, CourseDetailViewModel viewModel) => Scaffold(
        key: viewModel.attendanceViewScaffoldKey,
        appBar: buildAppBar(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.manageAttendanceModels == null
                  ? Center(child: Text('Not Found'))
                  : Column(
                      children: [
                        buildAttendanceStatusCard(context, viewModel),
                        buildStudentListView(viewModel),
                      ],
                    );
        }),
      ),
    );
  }

  Card buildAttendanceStatusCard(BuildContext context, CourseDetailViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingBitNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Total',
                    style: context.textTheme.subtitle2!
                        .copyWith(color: context.colorSchemeLight.blue)),
                Text(viewModel.manageAttendanceModels!.totalStudent!,
                    style: context.textTheme.bodyText2!
                        .copyWith(color: context.colorSchemeLight.blue)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Participate',
                    style: context.textTheme.subtitle2!
                        .copyWith(color: context.colorSchemeLight.green)),
                Text(viewModel.manageAttendanceModels!.participateStudent!,
                    style: context.textTheme.bodyText2!
                        .copyWith(color: context.colorSchemeLight.green)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Absent',
                    style:
                        context.textTheme.subtitle2!.copyWith(color: context.colorSchemeLight.red)),
                Text(viewModel.manageAttendanceModels!.absentStudent!,
                    style:
                        context.textTheme.bodyText2!.copyWith(color: context.colorSchemeLight.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, CourseDetailViewModel viewModel) {
    return AppBar(
      title: Text(date),
      actions: [
        Observer(builder: (_) {
          return IconButton(
              onPressed: () async {
                await viewModel.manageAttendanceStatus(typeOfUser, date, courseId);
              },
              icon: Icon(Icons.update));
        })
      ],
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
        itemCount: viewModel.manageAttendanceModel!.studentsArray!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: context.paddingLowHorizontal,
            child: Observer(builder: (_) {
              return StudentManageAttendanceCard(
                  courseDetailViewModel: viewModel, typeOfUser: typeOfUser, index: index);
            })),
      );
    });
  }
}
