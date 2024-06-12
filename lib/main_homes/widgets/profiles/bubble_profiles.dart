import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

class BubbleProfiles extends StatelessWidget {
  final int index;
  const BubbleProfiles({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = ApiService.infos[index];
    List<int> indices0 =
        List<int>.generate(ApiService.infos.length, (index) => index);
    indices0.shuffle(Random());
    final randomInfo0 = ApiService.infos[indices0[index]];
    List<int> indices1 =
        List<int>.generate(ApiService.infos.length, (index) => index);
    indices1.shuffle(Random());
    final randomInfo1 = ApiService.infos[indices1[index]];
    List<int> indices2 =
        List<int>.generate(ApiService.infos.length, (index) => index);
    indices2.shuffle(Random());
    final randomInfo2 = ApiService.infos[indices2[index]];
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: -10,
            right: -10,
            child: Offstage(
              offstage: info['replies'] == "2" || info['replies'] == "1",
              child: Transform.scale(
                scale: 0.5,
                child: BubbleProfile(
                  profilePath: randomInfo0['profile'],
                ),
              ),
            ),
          ),
          Positioned(
            left: -10,
            child: Offstage(
              offstage: info['replies'] == "2" || info['replies'] == "1",
              child: Transform.scale(
                scale: 0.4,
                child: BubbleProfile(
                  profilePath: randomInfo1['profile'],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            right: 0,
            child: Offstage(
              offstage: info['replies'] == "2" || info['replies'] == "1",
              child: Transform.scale(
                scale: 0.3,
                child: BubbleProfile(
                  profilePath: randomInfo2['profile'],
                ),
              ),
            ),
          ),
          Positioned(
            left: -3,
            top: -10,
            child: Offstage(
              offstage: info['replies'] != "2",
              child: Transform.scale(
                scale: 0.4,
                child: BubbleProfile(
                  profilePath: randomInfo1['profile'],
                ),
              ),
            ),
          ),
          Positioned(
            right: -8,
            top: -10,
            child: Offstage(
              offstage: info['replies'] != "2",
              child: Transform.scale(
                scale: 0.55,
                child: Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: FractionallySizedBox(
                    widthFactor: 0.7,
                    child: BubbleProfile(
                      profilePath: randomInfo2['profile'],
                    ),
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
