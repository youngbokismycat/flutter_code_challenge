import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/main_homes/main_home_screen.dart';
import 'package:tread_clone_assignment/main_navigations/widgets/custom_navigation_bar.dart';
import 'package:tread_clone_assignment/writing_thread/writing_thread_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
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
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      backgroundColor: Colors.white,
      builder: (context) {
        return const WritingThreadScreen();
      },
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    _isWritingThread = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: _isWritingThread
          ? EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
            )
          : EdgeInsets.zero,
      curve: Curves.easeOutCirc,
      child: AnimatedScale(
        curve: Curves.easeOutCirc,
        duration: const Duration(milliseconds: 500),
        scale: _isWritingThread ? 0.95 : 1,
        child: Scaffold(
          backgroundColor: Colors.black,
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
                offstage: _selectedIndex != 3,
                child: const Placeholder(),
              ),
              Offstage(
                offstage: _selectedIndex != 4,
                child: const Placeholder(),
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
    );
  }
}
