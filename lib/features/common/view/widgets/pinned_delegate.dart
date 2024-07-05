import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/theme/thread_colors.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/default_padding.dart';

class PinnedBar extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool isTabBar;
  final double height;
  final WidgetRef ref;

  PinnedBar({
    required this.child,
    required this.isTabBar,
    required this.height,
    required this.ref,
  });
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: isDarkMode(ref) ? ThreadColors.darkBgColor : Colors.white,
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
  double get maxExtent => height;
  @override
  double get minExtent => height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
