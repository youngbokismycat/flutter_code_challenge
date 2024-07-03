import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class CircularProfile extends ConsumerWidget {
  final int index;

  const CircularProfile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: BubbleProfile(
            profilePath: getImage(),
          ),
        ),
        Positioned(
          right: -3,
          bottom: -3,
          child: Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
              color: isDarkMode(ref) ? Colors.black : Colors.white,
              shape: BoxShape.circle,
            ),
            child: FractionallySizedBox(
              widthFactor: 0.83,
              heightFactor: 0.83,
              child: CircleAvatar(
                backgroundColor: isDarkMode(ref) ? Colors.white : Colors.black,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 12,
                  color: isDarkMode(ref) ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubbleProfile extends StatefulWidget {
  final String profilePath;
  const BubbleProfile({
    super.key,
    required this.profilePath,
  });

  @override
  State<BubbleProfile> createState() => _BubbleProfileState();
}

class _BubbleProfileState extends State<BubbleProfile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const CircleAvatar(
      backgroundImage: AssetImage(
        "assets/images/default_profile.webp",
      ),
      backgroundColor: Colors.white,
      radius: 23,
      foregroundImage: AssetImage(
        "assets/images/default_profile.webp",
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
