import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final IconData selectedicon;
  const CustomIconButton(
      {super.key, required this.icon, required this.selectedicon});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
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
            color: _isSelected &&
                    widget.selectedicon == FontAwesomeIcons.solidHeart
                ? Colors.red
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
