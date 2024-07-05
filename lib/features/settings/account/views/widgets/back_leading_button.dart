import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/default_padding.dart';

class BackLeadingButton extends ConsumerWidget {
  const BackLeadingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultPadding(
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.chevronLeft,
              size: Sizes.size18,
              color: isDarkMode(ref) ? Colors.white : Colors.black,
            ),
            Gaps.h5,
            Text(
              "Back",
              style: Theme.of(context).textTheme.bodySmall,
              textScaleFactor: 1.2,
            ),
          ],
        ),
      ),
    );
  }
}
