import 'dart:io';

import 'package:blog/utils/typedefs.dart';
import 'package:flutter/material.dart';

class AppRecyclerView extends StatelessWidget {
  final num currentPage;
  final num pages;
  final OnPressed onScrollEnd;
  final bool isLoading;
  ///
  /// When canFetch is true on scrolling to the end of the scroll view
  /// a request to fetch new recrods can be made, Otherwise the list
  ///  remains as it is and no new records can be fetched
  /// 
  final bool canFetch;
  final ScrollView child;

  AppRecyclerView({
    @required this.currentPage,
    @required this.pages,
    @required this.onScrollEnd,
    @required this.isLoading,
    @required this.child,
    this.canFetch = false,
  })  : assert(currentPage != null),
        assert(pages != null),
        assert(onScrollEnd != null),
        assert(child != null);

  bool overscrolled(ScrollNotification notifier) {
    if (Platform.isIOS) {
      return notifier.metrics.outOfRange &&
          notifier.metrics.axisDirection == AxisDirection.down;
    }
    return notifier is OverscrollNotification && notifier.overscroll > 0;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notifier) {
        if (!isLoading && (canFetch && overscrolled(notifier))) {
          onScrollEnd();
        }
        return true;
      },
      child: child,
    );
  }
}
