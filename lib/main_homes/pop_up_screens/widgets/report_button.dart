import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';

class ReportButton extends StatelessWidget {
  final String text;

  const ReportButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
      ),
      child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Opacity(
              opacity: 0.4,
              child: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
