import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/custom_text_style.dart';

class RepliesAndLikesRow extends StatelessWidget {
  final int index;
  const RepliesAndLikesRow({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = Informations.infos[index];
    return DefaultTextStyle(
      style: CustomTextStyle.greyBodyMidium,
      child: Row(
        children: [
          Text(
            "${info['replies']} replies ",
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
            " ${info['likes']} likes",
          ),
        ],
      ),
    );
  }
}
