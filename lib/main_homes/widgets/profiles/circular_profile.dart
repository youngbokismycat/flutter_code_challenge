import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

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
              color: isDarkMode(context) ? Colors.black : Colors.white,
              shape: BoxShape.circle,
            ),
            child: FractionallySizedBox(
              widthFactor: 0.83,
              heightFactor: 0.83,
              child: CircleAvatar(
                backgroundColor:
                    isDarkMode(context) ? Colors.white : Colors.black,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 12,
                  color: isDarkMode(context) ? Colors.black : Colors.white,
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
    return CircleAvatar(
      backgroundImage: const AssetImage(
        "assets/images/default_profile.webp",
      ),
      backgroundColor: Colors.white,
      radius: 23,
      foregroundImage: NetworkImage(
        widget.profilePath,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
