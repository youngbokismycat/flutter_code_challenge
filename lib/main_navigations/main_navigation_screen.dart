import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/main_homes/main_home_screen.dart';
import 'package:tread_clone_assignment/main_navigations/widgets/custom_navigation_bar.dart';

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
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const MainHomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Placeholder(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Placeholder(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const Placeholder(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const Placeholder(),
          ),
          Offstage(
            offstage: _selectedIndex != 5,
            child: const Placeholder(),
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        onselectedTap: _onselectedTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
