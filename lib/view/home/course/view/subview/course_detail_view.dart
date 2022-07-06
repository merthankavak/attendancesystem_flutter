import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_pickers/image_pickers.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../_product/_widgets/card/course_detail_card.dart';
import '../../../../_product/_widgets/card/student_card.dart';
import '../../../../menu/view/menu_view.dart';
import '../../viewmodel/subviewmodel/course_detail_view_model.dart';
import 'course_schedule_view.dart';

class CourseDetailView extends StatelessWidget {
  final String typeOfUser;
  final String courseId;

  const CourseDetailView({
    Key? key,
    required this.typeOfUser,
    required this.courseId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CourseDetailViewModel>(
        viewModel: CourseDetailViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          model.getCourseDetail(typeOfUser, courseId);
        },
        onPageBuilder: (BuildContext context, CourseDetailViewModel viewModel) => Scaffold(
              key: viewModel.detailScaffoldKey,
              appBar: buildAppBar(context, viewModel),
              drawer: const MenuView(),
              body: Observer(builder: (_) {
                return viewModel.isLoading
                    ? buildCenter()
                    : viewModel.courseDetailModel == null
                        ? const Center(child: Text('Not Found'))
                        : viewModel.courseDetailModel!.attendance!.isEmpty
                            ? CourseScheduleView(typeOfUser: typeOfUser, courseId: courseId)
                            : viewModel.currentIndex == 0
                                ? buildObserverCourseInfoColumn(viewModel)
                                : viewModel.currentIndex == 1
                                    ? buildStudentListView(viewModel)
                                    : buildAttendanceListView(viewModel);
              }),
              bottomNavigationBar: buildBottomNavigationBar(viewModel),
            ));
  }

  Observer buildBottomNavigationBar(CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.users),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Attendance',
          ),
        ],
        currentIndex: viewModel.currentIndex,
        onTap: (value) {
          viewModel.changeIndex(value);
        },
      );
    });
  }

  Observer buildObserverCourseInfoColumn(CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Observer(builder: (_) {
              return CourseDetailCard(
                  courseModel: viewModel.courseDetailModel!, typeOfUser: typeOfUser);
            }),
          ),
          const Spacer(flex: 6)
        ],
      );
    });
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar(BuildContext context, CourseDetailViewModel viewModel) {
    return AppBar(
        title: Text(LocaleKeys.course_title.tr()),
        leading: IconButton(
          onPressed: () {
            viewModel.detailScaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          typeOfUser == 'teacher'
              ? IconButton(
                  onPressed: () => viewModel.sendCourseDetailSettingsView(
                      typeOfUser, viewModel.courseDetailModel!.id!),
                  icon: const Icon(Icons.settings))
              : const SizedBox()
        ]);
  }

  Widget buildStudentListView(CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: viewModel.courseDetailModel!.students!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: context.paddingLowHorizontal,
            child: StudentCard(
                courseDetailViewModel: viewModel, typeOfUser: typeOfUser, index: index)),
      );
    });
  }

  Widget buildAttendanceListView(CourseDetailViewModel viewModel) {
    return Observer(builder: (_) {
      return ListView.separated(
        itemCount: viewModel.courseDetailModel!.attendance!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
            padding: context.paddingLowHorizontal,
            child: Container(
              padding: context.paddingLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    viewModel.courseDetailModel!.attendance![index].date!,
                    textAlign: TextAlign.left,
                  ),
                  typeOfUser == 'teacher'
                      ? Observer(builder: (_) {
                          return IconButton(
                              onPressed: () async => await showPicker(viewModel, context,
                                  viewModel.courseDetailModel!.attendance![index].date!),
                              icon: const Icon(Icons.more_vert_rounded));
                        })
                      : Observer(builder: (_) {
                          return viewModel.courseStudentAttendanceStatus![index].attendanceStatus ==
                                  'true'
                              ? Icon(Icons.check_box, color: context.colorSchemeLight.green)
                              : Icon(Icons.cancel_outlined, color: context.colorSchemeLight.red);
                        })
                ],
              ),
            )),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.black);
        },
      );
    });
  }

  Future<void> showPicker(
          CourseDetailViewModel viewModel, BuildContext context, String date) async =>
      await showModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Wrap(
                children: <Widget>[
                  Observer(builder: (_) {
                    return ListTile(
                        leading: const Icon(Icons.edit),
                        title: Text(LocaleKeys.course_teacher_attendance_edit.tr()),
                        onTap: () async {
                          await viewModel.sendCourseAttendanceView(typeOfUser, courseId, date);
                        });
                  }),
                  Observer(builder: (_) {
                    return ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: Text(LocaleKeys.course_teacher_attendance_photo.tr()),
                        onTap: () async {
                          await ImagePickers.pickerPaths(
                            galleryMode: GalleryMode.image,
                            selectCount: 1,
                            showCamera: true,
                            showGif: false,
                          ).then((value) async => await viewModel.takeAttendanceStatus(
                              typeOfUser, date, courseId, value.first));
                        });
                  }),
                  Observer(builder: (_) {
                    return ListTile(
                      leading: const Icon(Icons.photo_camera),
                      title: Text(LocaleKeys.course_teacher_attendance_camera.tr()),
                      onTap: () async {
                        await ImagePickers.openCamera(
                          cameraMimeType: CameraMimeType.photo,
                        ).then((value) async => await viewModel.takeAttendanceStatus(
                            typeOfUser, date, courseId, value!));
                      },
                    );
                  }),
                ],
              ),
            );
          });
}
