import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';

class BottomSheetAppbar extends StatelessWidget {
  const BottomSheetAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 4,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "New thread",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
