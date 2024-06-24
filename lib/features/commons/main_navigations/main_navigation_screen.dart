import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/activity/activity_screen.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/main_homes/main_home_screen.dart';
import 'package:tread_clone_assignment/features/commons/main_navigations/widgets/custom_navigation_bar.dart';
import 'package:tread_clone_assignment/features/profile/profile_screen.dart';
import 'package:tread_clone_assignment/features/search/search_screen.dart';
import 'package:tread_clone_assignment/features/writing_thread/writing_thread_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final int selectedIndex;

  const MainNavigationScreen({super.key, required this.selectedIndex});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _selectedIndex;
  bool _isWritingThread = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onselectedTap(int index) {
    _selectedIndex = index;
    setState(() {});

    // Navigate to the appropriate route
    switch (_selectedIndex) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/${RouteNames.search}');
        break;
      case 3:
        context.go('/${RouteNames.activity}');
        break;
      case 4:
        context.go('/${RouteNames.profile}');
        break;
    }
  }

  void _onMakeThreadButtonTap(BuildContext cotext) async {
    _isWritingThread = true;
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    setState(() {});
    await showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.92,
      enableDrag: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      backgroundColor:
          isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
      builder: (context) {
        return const WritingThreadScreen();
      },
    ).whenComplete(
      () async {
        await Future.delayed(
          const Duration(milliseconds: 25),
        );
        if (mounted) {
          FocusScope.of(context).unfocus();
        }
        if (!mounted) return;
        SystemChrome.setSystemUIOverlayStyle(
          isDarkMode(context)
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        );
        _isWritingThread = false;

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: _isWritingThread && Platform.isIOS
          ? EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top -
                  MediaQuery.of(context).size.height * 0.03,
            )
          : EdgeInsets.zero,
      curve: Curves.easeOutCirc,
      child: AnimatedScale(
        curve: Curves.easeOutCirc,
        duration: const Duration(milliseconds: 500),
        scale: _isWritingThread && Platform.isIOS ? 0.95 : 1,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Sizes.size14,
              ),
              topRight: Radius.circular(
                Sizes.size14,
              ),
            ),
          ),
          child: Scaffold(
            body: Stack(
              children: [
                Offstage(
                  offstage: _selectedIndex != 0,
                  child: const MainHomeScreen(),
                ),
                Offstage(
                  offstage: _selectedIndex != 1,
                  child: const SearchScreen(),
                ),
                Offstage(
                  offstage: _selectedIndex != 3,
                  child: const ActivityScreen(),
                ),
                Offstage(
                  offstage: _selectedIndex != 4,
                  child: const ProfileScreen(),
                ),
              ],
            ),
            bottomNavigationBar: CustomNavigationBar(
              onselectedTap: _onselectedTap,
              onMakeThreadButtonTap: _onMakeThreadButtonTap,
              selectedIndex: _selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
