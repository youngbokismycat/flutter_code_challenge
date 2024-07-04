import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class CustomCupertinoSearchTextField extends ConsumerStatefulWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  const CustomCupertinoSearchTextField({
    super.key,
    required this.focusNode,
    required this.textEditingController,
  });

  @override
  CustomCupertinoSearchTextFieldState createState() =>
      CustomCupertinoSearchTextFieldState();
}

class CustomCupertinoSearchTextFieldState
    extends ConsumerState<CustomCupertinoSearchTextField>
    with TickerProviderStateMixin {
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
        milliseconds: 50,
      ),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cancelAnimation = Tween<double>(
      begin: MediaQuery.of(context).size.width - 32,
      end: MediaQuery.of(context).size.width - (Platform.isIOS ? 96 : 92),
    ).animate(
      CurvedAnimation(
        parent: _animationCancelController,
        curve: Curves.easeOut,
      ),
    );
    _colorAnimation = ColorTween(
      begin: isDarkMode(ref) ? Colors.grey.shade800 : Colors.grey.shade100,
      end: isDarkMode(ref) ? Colors.grey.shade700 : Colors.grey.shade200,
    ).animate(_animationColorController);
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    _animationCancelController.dispose();
    _animationColorController.dispose();
    super.dispose();
  }

  void _focusNodeInit() {
    widget.focusNode.addListener(
      _searchAnimation,
    );
  }

  void _searchAnimation() async {
    if (widget.focusNode.hasFocus) {
      _animationCancelController.forward();
      await _animationColorController.forward();
      _animationColorController.reverse();
    } else {
      _animationCancelController.reverse();
    }
  }

  void _onTextFieldTap() {
    widget.focusNode.requestFocus();
  }

  void _onCancelTap() {
    widget.textEditingController.clear();
    widget.focusNode.unfocus();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction < 1) {
      widget.focusNode.canRequestFocus = false;
    } else {
      widget.focusNode.canRequestFocus = true;
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
                    controller: widget.textEditingController,
                    focusNode: widget.focusNode,
                    itemColor: isDarkMode(ref)
                        ? Colors.grey.shade500
                        : Colors.grey.shade900,
                    placeholderStyle: TextStyle(
                      color: isDarkMode(ref)
                          ? Colors.grey.shade500
                          : Colors.grey.shade500,
                    ),
                    style: TextStyle(
                      color:
                          isDarkMode(ref) ? Colors.grey.shade500 : Colors.black,
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
