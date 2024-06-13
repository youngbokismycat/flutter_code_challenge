import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';

class StickHandler extends StatelessWidget {
  const StickHandler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Sizes.size12,
      ),
      child: Container(
        height: 4.2,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}
