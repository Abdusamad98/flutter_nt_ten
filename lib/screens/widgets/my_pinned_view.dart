import 'package:flutter/material.dart';

class MyPinnedView extends SliverPersistentHeaderDelegate {
  const MyPinnedView();

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 100,
      color: Colors.black,
    );
  }
}
