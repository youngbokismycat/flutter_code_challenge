import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class StackedTwoProfiles extends StatelessWidget {
  final Color backgroundColor;
  const StackedTwoProfiles({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size24),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: const AssetImage(
              "assets/images/default_profile.webp",
            ),
            foregroundImage: NetworkImage(
              getImage(),
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: const AssetImage(
                    "assets/images/default_profile.webp",
                  ),
                  foregroundImage: NetworkImage(
                    getImage(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
