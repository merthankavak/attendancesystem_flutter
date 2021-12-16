import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/theme/light/color_scheme_light.dart';
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
    return Card(child: buildPadding(context));
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding: context.paddingBitNormal,
      child: buildRow(),
    );
  }

  Row buildRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CircleAvatar(
              backgroundColor: ColorSchemeLight.instance!.transparent,
              child: Image(
                  width: 50,
                  height: 50,
                  image: CachedNetworkImageProvider(
                      courseDetailViewModel.courseDetailModel!.students![index].imageUrl!)),
              radius: 30),
        ),
        Expanded(
            flex: 8,
            child: Text(courseDetailViewModel.courseDetailModel!.students![index].fullName!)),
      ],
    );
  }

  Center buildCenter() => Center(child: CircularProgressIndicator());
}
