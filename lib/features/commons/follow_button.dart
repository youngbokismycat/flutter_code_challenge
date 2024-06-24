import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class FollowButton extends StatelessWidget {
  final bool isFollow;
  final bool isFilled;
  const FollowButton({
    super.key,
    required this.isFollow,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size24,
        vertical: Sizes.size4,
      ),
      decoration: BoxDecoration(
        color: isDarkMode(context)
            ? const Color.fromARGB(255, 20, 20, 20)
            : Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
        border: isFilled
            ? null
            : Border.all(
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
      ),
      child: Align(
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.center,
        child: Opacity(
          opacity: isFollow ? 0.5 : 1,
          child: Text(
            isFollow ? "Following" : "Follow",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
