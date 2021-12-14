import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Widget Function(int index) onListItem;
  const IndicatorListView(
      {Key? key, required this.itemCount, required this.currentIndex, required this.onListItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildListViewBuilder();
  }

  ListView buildListViewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => buildPadding(context, index),
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      radius: radiusValue(index, context),
      backgroundColor:
          isCurrentIndex(index) ? context.colorSchemeLight.blue : context.colorSchemeLight.black,
      child: animatedOpacity(index, context),
    );
  }

  AnimatedOpacity animatedOpacity(int index, BuildContext context) {
    return AnimatedOpacity(
        opacity: opacityValue(index), duration: context.normalDuration, child: onListItem(index));
  }

  double radiusValue(int index, BuildContext context) =>
      isCurrentIndex(index) ? context.width * .03 : context.width * .015;

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentIndex == index;
}
