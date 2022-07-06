import 'package:flutter/material.dart';

import '../../../../core/components/listview/indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  const OnBoardIndicator({Key? key, required this.itemCount, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (int index) {
        return const SizedBox.shrink();
      },
    );
  }
}
