import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/features/commons/main_navigations/widgets/make_thread_button.dart';
import 'package:tread_clone_assignment/features/commons/main_navigations/widgets/nav_tab.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.onselectedTap,
    required this.onMakeThreadButtonTap,
    required this.selectedIndex,
  });
  final Function onMakeThreadButtonTap;
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
            MakeThreadButton(
              onTap: onMakeThreadButtonTap,
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
