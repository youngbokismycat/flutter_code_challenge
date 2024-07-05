import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/profiles/circular_profile.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';

class WriterRepliersColumn extends StatelessWidget {
  const WriterRepliersColumn({
    super.key,
    required this.index,
    required this.contentsHeight,
    required this.threadData,
  });
  final double? contentsHeight;
  final ThreadModel threadData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double dividerHeight =
        contentsHeight != null ? contentsHeight! + 18 : 0;
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: dividerHeight,
            maxWidth: 200,
          ),
          child: Column(
            children: [
              CircularProfile(index: index),
              Gaps.v10,
              Expanded(
                child: VerticalDivider(
                  thickness: 2,
                  color: Theme.of(context).dividerColor.withOpacity(
                        0.8,
                      ),
                  width: 1,
                ),
              ),
              BubbleProfiles(
                threadData: threadData,
                index: index,
              ),
              Gaps.v20,
            ],
          ),
        ),
      ],
    );
  }
}
