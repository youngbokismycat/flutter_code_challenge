import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
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

  final bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNodeInit();
    _animationCancelController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationColorController = AnimationController(
      duration: const Duration(
        milliseconds: 100,
      ),
      vsync: this,
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
    _colorAnimation = ColorTween(
      begin: isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade100,
      end: isDarkMode(context) ? Colors.grey.shade700 : Colors.grey.shade200,
    ).animate(_animationColorController);
  }

  @override
  void dispose() {
    _focusSearchNode.dispose();
    _animationCancelController.dispose();
    _animationColorController.dispose();
    super.dispose();
  }

  void _focusNodeInit() {
    _focusSearchNode = FocusNode();
    _focusSearchNode.addListener(
      _searchAnimation,
    );
  }

  void _searchAnimation() async {
    if (_focusSearchNode.hasFocus) {
      _animationCancelController.forward();
      await _animationColorController.forward();
      _animationColorController.reverse();
    } else {
      _animationCancelController.reverse();
    }
  }

  void _onTextFieldTap() {
    _focusSearchNode.requestFocus();
  }

  void _onCancelTap() {
    _focusSearchNode.unfocus();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction < 1) {
      _focusSearchNode.canRequestFocus = false;
    } else {
      _focusSearchNode.canRequestFocus = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTextFieldTap,
      child: AnimatedBuilder(
        animation: Listenable.merge(
          [
            _animationCancelController,
            _animationColorController,
          ],
        ),
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
                  key: const Key('key-board'),
                  onVisibilityChanged: _onVisibilityChanged,
                  child: CupertinoSearchTextField(
                    focusNode: _focusSearchNode,
                    itemColor: isDarkMode(context)
                        ? Colors.grey.shade500
                        : Colors.grey.shade900,
                    placeholderStyle: TextStyle(
                      color: isDarkMode(context)
                          ? Colors.grey.shade500
                          : Colors.grey.shade500,
                    ),
                    style: TextStyle(
                      color: isDarkMode(context)
                          ? Colors.grey.shade500
                          : Colors.black,
                    ),
                    enabled: true,
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
