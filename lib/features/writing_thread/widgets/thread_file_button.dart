import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';

class ThreadFileButton extends StatefulWidget {
  final double left;
  final double bottom;
  final Widget icon;
  final Function() onTap;

  const ThreadFileButton({
    super.key,
    required this.icon,
    required this.left,
    required this.bottom,
    required this.onTap,
  });

  @override
  State<ThreadFileButton> createState() => _ThreadFileButtonState();
}

class _ThreadFileButtonState extends State<ThreadFileButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      bottom: widget.bottom,
      child: DeferPointer(
        paintOnTop: true,
        child: Opacity(
          opacity: 0.4,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.onTap,
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
