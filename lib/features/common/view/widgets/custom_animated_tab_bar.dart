import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class CustomAnimatedTabBar extends StatelessWidget {
  const CustomAnimatedTabBar({
    super.key,
    required this.ref,
    required this.tabController,
    required this.options,
    required this.padding,
  });

  final WidgetRef ref;
  final TabController tabController;
  final List<String> options;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TabBar(
        tabAlignment: TabAlignment.center,
        padding: padding,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.size8,
        ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isDarkMode(ref) ? Colors.black : Colors.white,
            ),
        unselectedLabelColor: isDarkMode(ref) ? Colors.white : Colors.black,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.white,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          color: isDarkMode(ref) ? Colors.white : Colors.black,
        ),
        isScrollable: true,
        controller: tabController,
        tabs: [
          for (var option in options)
            FractionallySizedBox(
              heightFactor: 1.06,
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                        width: 110,
                        child: Center(
                          child: Text(
                            option,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: AnimatedOpacity(
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        opacity: option ==
                                options.elementAt(
                                  tabController.index,
                                )
                            ? 0
                            : 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).dividerColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              Sizes.size10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
