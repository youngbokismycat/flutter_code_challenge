import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onselectedTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Text",
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        onselectedTap: _onselectedTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onselectedTap,
    required this.selectedIndex,
  });
  final Function onselectedTap;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              onTap: () => onselectedTap(0),
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              isSelected: selectedIndex == 0,
            ),
            NavTab(
              onTap: () => onselectedTap(1),
              icon: FontAwesomeIcons.magnifyingGlass,
              selectedIcon: FontAwesomeIcons.magnifyingGlass,
              isSelected: selectedIndex == 1,
            ),
            NavTab(
              onTap: () => onselectedTap(2),
              icon: FontAwesomeIcons.penToSquare,
              selectedIcon: FontAwesomeIcons.solidPenToSquare,
              isSelected: selectedIndex == 2,
            ),
            NavTab(
              onTap: () => onselectedTap(3),
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: selectedIndex == 3,
            ),
            NavTab(
              onTap: () => onselectedTap(4),
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: selectedIndex == 4,
            ),
          ],
        ),
      ),
    );
  }
}

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
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
