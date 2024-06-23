import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tread_clone_assignment/activity/activity_screen.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/main_homes/main_home_screen.dart';
import 'package:tread_clone_assignment/main_navigations/widgets/custom_navigation_bar.dart';
import 'package:tread_clone_assignment/profile/profile_screen.dart';
import 'package:tread_clone_assignment/search/search_screen.dart';
import 'package:tread_clone_assignment/writing_thread/writing_thread_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;
  bool _isWritingThread = false;

  void _onselectedTap(int index) {
    _selectedIndex = index;
    setState(() {});
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
      padding: _isWritingThread
          ? EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top - 20,
            )
          : EdgeInsets.zero,
      curve: Curves.easeOutCirc,
      child: AnimatedScale(
        curve: Curves.easeOutCirc,
        duration: const Duration(milliseconds: 500),
        scale: _isWritingThread ? 0.95 : 1,
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
