import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MakeThreadButton extends StatelessWidget {
  const MakeThreadButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.selectedIcon,
    required this.onTap,
  });
  final Duration _tabBarDuration = const Duration(
    milliseconds: 200,
  );
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        child: GestureDetector(
          onTap: () => onTap(context),
          child: AnimatedOpacity(
            duration: _tabBarDuration,
            opacity: isSelected ? 1 : 0.3,
            child: FaIcon(
              isSelected ? selectedIcon : icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
