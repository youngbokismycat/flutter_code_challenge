import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

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