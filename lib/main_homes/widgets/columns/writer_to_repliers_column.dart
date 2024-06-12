import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/bubble_profiles.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

class WriterToRepliersColumn extends StatelessWidget {
  final int index;

  const WriterToRepliersColumn({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = ApiService.infos[index];
    final size = MediaQuery.of(context).size;
    return Column(
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
        Gaps.v10,
        BubbleProfiles(
          index: index,
        ),
      ],
    );
  }
}
