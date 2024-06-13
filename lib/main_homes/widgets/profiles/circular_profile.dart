import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/informations.dart';

class CircularProfile extends StatelessWidget {
  final int index;
  const CircularProfile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = Informations.infos[index];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: BubbleProfile(
            profilePath: info['profile'],
          ),
        ),
        Positioned(
          right: -3,
          bottom: -3,
          child: Container(
            height: 23,
            width: 23,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const FractionallySizedBox(
              widthFactor: 0.83,
              heightFactor: 0.83,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubbleProfile extends StatelessWidget {
  final String profilePath;
  const BubbleProfile({
    super.key,
    required this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 23,
      foregroundImage: AssetImage(
        profilePath,
      ),
    );
  }
}
