import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class CustomIconButton extends ConsumerStatefulWidget {
  final IconData icon;
  final IconData selectedicon;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.selectedicon,
  });

  @override
  CustomIconButtonState createState() => CustomIconButtonState();
}

class CustomIconButtonState extends ConsumerState<CustomIconButton> {
  bool _isSelected = false;
  void _isTap() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isTap,
      child: SizedBox(
        width: 30,
        height: 30,
        child: Center(
          child: FaIcon(
            _isSelected ? widget.selectedicon : widget.icon,
            color: isDarkMode(ref) ? Colors.white : Colors.black,
            size: Sizes.size20 + 2,
          ),
        ),
      ),
    );
  }
}
