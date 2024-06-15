import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomCupertinoSearchTextField extends StatefulWidget {
  const CustomCupertinoSearchTextField({
    super.key,
  });

  @override
  State<CustomCupertinoSearchTextField> createState() =>
      _CustomCupertinoSearchTextFieldState();
}

class _CustomCupertinoSearchTextFieldState
    extends State<CustomCupertinoSearchTextField>
    with TickerProviderStateMixin {
  late FocusNode _focusSearchNode;
  late AnimationController _animationColorController;
  late AnimationController _animationCancelController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _cancelAnimation;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _focusSearchNode = FocusNode();

    _animationColorController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animationCancelController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: CupertinoColors.systemGrey5.withOpacity(
        0.5,
      ),
      end: CupertinoColors.systemGrey5,
    ).animate(_animationColorController);

    _animationCancelController.addListener(() {
      setState(() {});
    });

    _focusSearchNode.addListener(
      () async {
        if (_focusSearchNode.hasFocus) {
          _animationCancelController.forward();
          await _animationColorController.forward();
          _animationColorController.reverse();
        } else {
          _animationCancelController.reverse();
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cancelAnimation = Tween<double>(
      begin: MediaQuery.of(context).size.width - 32,
      end: MediaQuery.of(context).size.width - 92,
    ).animate(
      CurvedAnimation(
        parent: _animationCancelController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _focusSearchNode.dispose();
    _animationCancelController.dispose();
    _animationColorController.dispose();
    super.dispose();
  }

  void _onTextFieldTap() {
    _focusSearchNode.requestFocus();
  }

  void _onCancelTap() {
    _focusSearchNode.unfocus();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    setState(() {
      _isVisible = info.visibleFraction > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTextFieldTap,
      child: AnimatedBuilder(
        animation: _animationColorController,
        builder: (context, child) => SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: _cancelAnimation.value,
                ),
                child: VisibilityDetector(
                  key: const Key('text-field-visibility-detector'),
                  onVisibilityChanged: _onVisibilityChanged,
                  child: CupertinoSearchTextField(
                    enabled: _isVisible,
                    focusNode: _focusSearchNode,
                    backgroundColor: _colorAnimation.value,
                  ),
                ),
              ),
              Gaps.h10,
              GestureDetector(
                onTap: _onCancelTap,
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
