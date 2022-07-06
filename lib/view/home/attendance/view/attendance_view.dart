import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:full_screen_image/full_screen_image.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
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
        model.getCourseDetail(typeOfUser, courseId);
        model.showAttendanceStatus(date, courseId);
      },
      onPageBuilder: (BuildContext context, CourseDetailViewModel viewModel) => Scaffold(
        key: viewModel.attendanceViewScaffoldKey,
        appBar: buildAppBar(context, viewModel),
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.manageAttendanceModel == null
                  ? const Center(child: Text('Not Found'))
                  : viewModel.detailModel == null
                      ? const Center(child: Text('Not Found'))
                      : buildColumn(context, viewModel);
        }),
      ),
    );
  }

  Column buildColumn(BuildContext context, CourseDetailViewModel viewModel) {
    return Column(
      children: [
        Expanded(flex: 20, child: buildAttendanceStatusCard(context, viewModel)),
        viewModel.manageAttendanceModels!.imageUrl == null
            ? const SizedBox()
            : Expanded(
                flex: 35,
                child: Column(
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(LocaleKeys.course_teacher_attendance_attendancePhoto.tr())),
                    Expanded(flex: 90, child: buildAttendanceImageCard(context, viewModel)),
                  ],
                )),
        Expanded(flex: 45, child: buildStudentListView(viewModel)),
      ],
    );
  }

  Card buildAttendanceStatusCard(BuildContext context, CourseDetailViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingBitNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildAttendanceStatusTotalColumn(context, viewModel),
            buildAttendanceStatusParticipantsColumn(context, viewModel),
            buildAttendanceStatusAbsentColumn(context, viewModel)
          ],
        ),
      ),
    );
  }

  FullScreenWidget buildAttendanceImageCard(BuildContext context, CourseDetailViewModel viewModel) {
    return FullScreenWidget(
      child: Hero(
        tag: viewModel.manageAttendanceModels!.imageUrl!,
        child: Image(
            image: CachedNetworkImageProvider(
          viewModel.manageAttendanceModels!.imageUrl!,
        )),
      ),
    );
  }

  Column buildAttendanceStatusAbsentColumn(BuildContext context, CourseDetailViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(LocaleKeys.course_teacher_attendance_absent.tr(),
            style: context.textTheme.subtitle2!.copyWith(color: context.colorSchemeLight.red)),
        Text(viewModel.manageAttendanceModels!.absentStudent!,
            style: context.textTheme.bodyText2!.copyWith(color: context.colorSchemeLight.red))
      ],
    );
  }

  Column buildAttendanceStatusParticipantsColumn(
      BuildContext context, CourseDetailViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(LocaleKeys.course_teacher_attendance_participants.tr(),
            style: context.textTheme.subtitle2!.copyWith(color: context.colorSchemeLight.green)),
        Text(viewModel.manageAttendanceModels!.participateStudent!,
            style: context.textTheme.bodyText2!.copyWith(color: context.colorSchemeLight.green))
      ],
    );
  }

  Column buildAttendanceStatusTotalColumn(BuildContext context, CourseDetailViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(LocaleKeys.course_teacher_attendance_tot.tr(),
            style: context.textTheme.subtitle2!.copyWith(color: context.colorSchemeLight.blue)),
        Text(viewModel.manageAttendanceModels!.totalStudent!,
            style: context.textTheme.bodyText2!.copyWith(color: context.colorSchemeLight.blue))
      ],
    );
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, CourseDetailViewModel viewModel) {
    return AppBar(
      title: Text(date),
      actions: [
        Observer(builder: (_) {
          return IconButton(
              onPressed: () async {
                await viewModel.manageAttendanceStatus(typeOfUser, date, courseId);
              },
              icon: const Icon(FontAwesomeIcons.save));
        })
      ],
      leading: IconButton(
          onPressed: () async {
            await viewModel.sendCourseDetailView(typeOfUser, courseId);
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft)),
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
