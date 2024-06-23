import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
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
          onTap: () => onTap(),
          child: AnimatedOpacity(
            duration: _tabBarDuration,
            opacity: isSelected ? 1 : 0.3,
            child: FaIcon(
              isSelected ? selectedIcon : icon,
              color: isDarkMode(context) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
