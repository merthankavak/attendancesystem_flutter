import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:full_screen_image/full_screen_image.dart';

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
              children: [
                Expanded(
                    flex: 1,
                    child: FullScreenWidget(
                      child: Hero(
                        tag: courseDetailViewModel.courseDetailModel!.students![index].id!,
                        child: ClipOval(
                          child: Image(
                              fit: BoxFit.fill,
                              height: context.height * 0.06,
                              width: context.width * 0.06,
                              image: CachedNetworkImageProvider(courseDetailViewModel
                                  .courseDetailModel!.students![index].imageUrl!)),
                        ),
                      ),
                    )),
                const Spacer(flex: 1),
                Expanded(
                    flex: 8,
                    child:
                        Text(courseDetailViewModel.courseDetailModel!.students![index].fullName!)),
              ],
            )));
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());
}
