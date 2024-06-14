import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

String randomNum() {
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
