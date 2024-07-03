import 'package:flutter/material.dart';

import 'package:tread_clone_assignment/core/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';

class RepliesAndLikesRow extends StatelessWidget {
  final int index;
  final int likes;
  final int replies;
  const RepliesAndLikesRow({
    super.key,
    required this.index,
    required this.likes,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: CustomTextStyle.greyBodyMidium,
      child: Row(
        children: [
          Text(
            "$replies replies ",
          ),
          const Text(
            ".",
            strutStyle: StrutStyle(
              forceStrutHeight: true,
              height: 0.2,
              fontSize: 40,
            ),
          ),
          Text(
            " $likes likes",
          ),
        ],
      ),
    );
  }
}
