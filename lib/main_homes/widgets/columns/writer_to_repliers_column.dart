import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

class WriterRepliersColumn extends StatelessWidget {
  const WriterRepliersColumn({
    super.key,
    required this.index,
    required this.contentsHeight,
  });
  final double? contentsHeight;

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
