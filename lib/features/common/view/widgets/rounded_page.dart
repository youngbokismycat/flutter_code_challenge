import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';

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
