import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

class LandScapeCard extends StatelessWidget {
  final faker = Faker.instance;
  LandScapeCard({
    super.key,
    required this.size,
    required this.landscape,
  });

  final Size size;
  final dynamic landscape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Image.asset(
          landscape,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
