import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/features/common/widgets/cusom_icon_button.dart';

class FourButtons extends StatelessWidget {
  const FourButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomIconButton(
          icon: FontAwesomeIcons.heart,
          selectedicon: FontAwesomeIcons.solidHeart,
        ),
        Gaps.h16,
        CustomIconButton(
          icon: FontAwesomeIcons.comment,
          selectedicon: FontAwesomeIcons.solidComment,
        ),
        Gaps.h16,
        CustomIconButton(
          icon: FontAwesomeIcons.arrowsRotate,
          selectedicon: FontAwesomeIcons.arrowsRotate,
        ),
        Gaps.h16,
        CustomIconButton(
          icon: FontAwesomeIcons.paperPlane,
          selectedicon: FontAwesomeIcons.solidPaperPlane,
        ),
      ],
    );
  }
}
