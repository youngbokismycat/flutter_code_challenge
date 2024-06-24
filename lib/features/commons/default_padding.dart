import 'package:flutter/cupertino.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';

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
