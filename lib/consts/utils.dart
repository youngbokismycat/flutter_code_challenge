import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
}

bool getBoolean() {
  final random = Random();
  return random.nextBool();
}

Color getColor() {
  final random = Random();
  // Generate random values for red, green, and blue components
  int red = random.nextInt(256);
  int green = random.nextInt(256);
  int blue = random.nextInt(256);

  return Color.fromARGB(255, red, green, blue); // Full opacity (255)
}

IconData getIcon() {
  final random = Random();

  List<IconData> icons = [
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.solidStar,
    FontAwesomeIcons.solidUser,
    FontAwesomeIcons.share,
    FontAwesomeIcons.threads,
  ];

  return icons[random.nextInt(icons.length)];
}

String getNum() {
  final random = Random();
  int randomInt = random.nextInt(100);
  int randomDouble = random.nextInt(10);

  bool isInt = random.nextBool(); // Randomly choose between true and false

  if (isInt) {
    // Generates a random integer between 0 and 9999
    return '${randomInt}K';
  } else {
    // Generates a random double between 0.0 and 1.0
    return '$randomInt.${randomDouble}K';
  }
}

String getInt() {
  final random = Random();
  int randomInt = random.nextInt(10);
  return randomInt.toString();
}

double getScreenHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

class RoundedPage extends StatelessWidget {
  final Widget child;
  const RoundedPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Sizes.size14,
            ),
            topRight: Radius.circular(
              Sizes.size14,
            ),
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}

class DefaultPadding extends StatelessWidget {
  final Widget child;
  const DefaultPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
      ),
      child: child,
    );
  }
}

class CircleProfileNoNeedPathOrIndex extends StatefulWidget {
  final double radius;
  final bool isHaveBorder;
  const CircleProfileNoNeedPathOrIndex({
    super.key,
    required this.radius,
    required this.isHaveBorder,
  });

  @override
  State<CircleProfileNoNeedPathOrIndex> createState() =>
      _CircleProfileNoNeedPathOrIndexState();
}

class _CircleProfileNoNeedPathOrIndexState
    extends State<CircleProfileNoNeedPathOrIndex>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundImage: const AssetImage(
            "assets/images/default_profile.webp",
          ),
          foregroundImage: NetworkImage(
            getImage(),
          ),
        ),
        if (widget.isHaveBorder)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).disabledColor.withOpacity(
                        0.2,
                      ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class FollowButton extends StatelessWidget {
  final bool isFollow;
  final bool isFilled;
  const FollowButton({
    super.key,
    required this.isFollow,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size24,
        vertical: Sizes.size4,
      ),
      decoration: BoxDecoration(
        color: isFilled ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
        border: isFilled
            ? null
            : Border.all(
                width: 1.3,
                color: Theme.of(context).dividerColor,
              ),
      ),
      child: Align(
        widthFactor: 1,
        heightFactor: 1,
        alignment: Alignment.center,
        child: Opacity(
          opacity: isFollow ? 0.5 : 1,
          child: Text(
            isFollow ? "Following" : "Follow",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isFilled ? Colors.white : null,
                ),
          ),
        ),
      ),
    );
  }
}

class StackedTwoProfiles extends StatelessWidget {
  final Color backgroundColor;
  const StackedTwoProfiles({
    super.key,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.size24),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundImage: const AssetImage(
              "assets/images/default_profile.webp",
            ),
            foregroundImage: NetworkImage(
              getImage(),
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              width: 25,
              height: 25,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: const AssetImage(
                    "assets/images/default_profile.webp",
                  ),
                  foregroundImage: NetworkImage(
                    getImage(),
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
