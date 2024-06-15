import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/break_points.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/main_homes/widgets/cards/landscape_card.dart';

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
    final size = MediaQuery.of(context).size;
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
                  Expanded(
                    child: LandScapeCard(
                      size: size,
                    ),
                  ),
                  if (MediaQuery.of(context).size.width > Breakpoints.md)
                    Expanded(
                      child: LandScapeCard(
                        size: size,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
