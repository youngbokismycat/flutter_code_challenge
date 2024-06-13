import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/main_homes/widgets/cards/landscape_card.dart';
import 'package:tread_clone_assignment/main_homes/widgets/thread.dart';

class LandscapePageView extends StatelessWidget {
  final PageController _pageController = PageController(
    keepPage: true,
    viewportFraction: 0.5,
  );
  final int index;
  LandscapePageView({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final info = ApiService.infos[index];
    final List<dynamic> images = info['landscape'];
    return FractionallySizedBox(
      widthFactor: 2,
      child: SizedBox(
        height: images.isEmpty ? 0 : 200,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            for (dynamic landscape in info['landscape'])
              LandScapeCard(
                size: size,
                landscape: landscape,
              ),
          ],
        ),
      ),
    );
  }
}
