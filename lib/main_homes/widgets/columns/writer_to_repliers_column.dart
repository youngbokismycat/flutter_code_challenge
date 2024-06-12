import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

class WriterToRepliersColumn extends StatelessWidget {
  final int index;
  final double landscapeSize;
  const WriterToRepliersColumn({
    super.key,
    required this.index,
    required this.landscapeSize,
  });

  @override
  Widget build(BuildContext context) {
    final info = ApiService.infos[index];
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CircularProfile(index: index),
        Gaps.v10,
        SizedBox(
          height: info['landscape'] == null
              ? size.height * 0.04
              : landscapeSize + size.height * 0.04,
          child: VerticalDivider(
            thickness: 2,
            color: Theme.of(context).dividerColor.withOpacity(
                  0.8,
                ),
            width: 1,
          ),
        ),
      ],
    );
  }
}
