import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/search/widgets/animated_cupertino_search_textfield.dart';

class PinnedSearchBar extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool isTabBar;

  PinnedSearchBar({
    required this.child,
    required this.isTabBar,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: isTabBar
            ? child
            : DefaultPadding(
                child: child,
              ),
      ),
    );
  }

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 50;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}