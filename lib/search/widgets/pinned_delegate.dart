import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class PinnedBar extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool isTabBar;

  PinnedBar({
    required this.child,
    required this.isTabBar,
  });
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: isDarkMode(context)
          ? const Color.fromARGB(255, 20, 20, 20)
          : Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: isTabBar
            ? child
            : DefaultPadding(
                child: child,
              ),
      ),
    );
  }

  @override
  double get maxExtent => 40;
  @override
  double get minExtent => 40;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
