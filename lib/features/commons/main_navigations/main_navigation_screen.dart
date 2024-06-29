import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class MainNavigationScreen extends ConsumerStatefulWidget {
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  bool _isWritingThread = false;
  late int _selectedIndex = RouteNames.mainNavigationRoutes.indexOf(
    widget.tab,
  );

  void _onselectedTap(int index) {
    context.go('/${RouteNames.mainNavigationRoutes[index]}');
    setState(() {
      _selectedIndex = index;
    });
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
      backgroundColor: isDarkMode(ref) ? Colors.grey.shade900 : Colors.white,
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
          isDarkMode(ref)
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
    return AnimatedSlide(
      duration: const Duration(
        milliseconds: 500,
      ),
      offset: _isWritingThread
          ? Offset(
              0,
              (MediaQuery.of(context).viewPadding.top /
                      MediaQuery.of(context).size.height) *
                  0.5,
            )
          : const Offset(
              0,
              0,
            ),
      curve: Curves.easeOutCirc,
      child: AnimatedScale(
        curve: Curves.easeOutCirc,
        duration: const Duration(
          milliseconds: 500,
        ),
        scale: _isWritingThread ? 0.95 : 1,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                _isWritingThread ? Sizes.size14 : 0,
              ),
              topRight: Radius.circular(
                _isWritingThread ? Sizes.size14 : 0,
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
