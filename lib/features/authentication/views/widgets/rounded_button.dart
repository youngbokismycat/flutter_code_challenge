import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final double verticalPadding;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
    this.color = Colors.transparent,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            disabled
                ? LoadingAnimationWidget.waveDots(
                    color: Colors.white,
                    size: Sizes.size24,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
