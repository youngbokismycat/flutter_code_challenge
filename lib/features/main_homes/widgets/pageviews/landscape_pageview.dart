import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/features/commons/landscape_card.dart';
import 'package:tread_clone_assignment/core/consts/break_points.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';

class LandscapePageView extends StatelessWidget {
  final PageController pageController = PageController(
    keepPage: true,
    viewportFraction: 0.25,
  );
  final int index;
  LandscapePageView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = Informations.infos[index];
    final List<dynamic> images = info['landscape'];
    return FractionallySizedBox(
      widthFactor: 4,
      child: SizedBox(
        height: images.isEmpty ? 0 : 200,
        child: PageView(
          pageSnapping: false,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            for (var i = 0; i < 100; i++)
              Row(
                children: [
                  const Expanded(
                    child: LandScapeCard(),
                  ),
                  if (MediaQuery.of(context).size.width > Breakpoints.md)
                    const Expanded(
                      child: LandScapeCard(),
                    ),
                  if (MediaQuery.of(context).size.width > Breakpoints.lg)
                    const Expanded(
                      child: LandScapeCard(),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
