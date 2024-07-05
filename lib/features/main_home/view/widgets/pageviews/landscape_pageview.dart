import 'package:flutter/material.dart';

import 'package:tread_clone_assignment/core/consts/break_points.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/landscape_card.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';

class LandscapePageView extends StatelessWidget {
  final PageController pageController = PageController(
    keepPage: true,
    viewportFraction: 0.25,
  );
  final ThreadModel threadData;
  final int index;
  LandscapePageView({
    super.key,
    required this.threadData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 4,
      child: SizedBox(
        height: threadData.imageUrl == null ? 0 : 200,
        child: PageView(
          pageSnapping: false,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            LandScapeCard(
              url: threadData.imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
