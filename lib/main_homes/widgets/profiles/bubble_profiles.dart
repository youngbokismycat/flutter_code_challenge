import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

class BubbleProfiles extends StatefulWidget {
  final int index;
  const BubbleProfiles({
    super.key,
    required this.index,
  });

  @override
  State<BubbleProfiles> createState() => _BubbleProfilesState();
}

class _BubbleProfilesState extends State<BubbleProfiles>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final info = Informations.infos[widget.index];

    return SizedBox(
      width: 50,
      height: 30,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            right: -10,
            child: Offstage(
              offstage: info['replies'] == "2" || info['replies'] == "1",
              child: Transform.scale(
                scale: 0.5,
                child: BubbleProfile(
                  profilePath: getImage(),
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
                  profilePath: getImage(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            right: 0,
            child: Offstage(
              offstage: info['replies'] == "2" || info['replies'] == "1",
              child: Transform.scale(
                scale: 0.3,
                child: BubbleProfile(
                  profilePath: getImage(),
                ),
              ),
            ),
          ),
          Positioned(
            left: -3,
            child: Offstage(
              offstage: info['replies'] != "2",
              child: Transform.scale(
                scale: 0.4,
                child: BubbleProfile(
                  profilePath: getImage(),
                ),
              ),
            ),
          ),
          Positioned(
            right: -8,
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
                      profilePath: getImage(),
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
