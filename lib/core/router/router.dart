/* import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/activity/activity_screen.dart';
import 'package:tread_clone_assignment/features/commons/main_navigations/main_navigation_screen.dart';
import 'package:tread_clone_assignment/features/main_homes/main_home_screen.dart';
import 'package:tread_clone_assignment/features/profile/profile_screen.dart';
import 'package:tread_clone_assignment/features/search/search_screen.dart';
import 'package:tread_clone_assignment/features/settings/privacy/privacy_screen.dart';
import 'package:tread_clone_assignment/features/settings/settings_screen.dart';

final routeObserverProvider = RouteObserver<ModalRoute<void>>();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.home,
      builder: (context, state) => const MainNavigationScreen(selectedIndex: 0),
    ),
    GoRoute(
      path: '/${RouteNames.search}',
      name: RouteNames.search,
      builder: (context, state) => const MainNavigationScreen(selectedIndex: 1),
    ),
    GoRoute(
      path: '/${RouteNames.activity}',
      name: RouteNames.activity,
      builder: (context, state) => const MainNavigationScreen(selectedIndex: 3),
    ),
    GoRoute(
      path: '/${RouteNames.profile}',
      name: RouteNames.profile,
      builder: (context, state) => const MainNavigationScreen(selectedIndex: 4),
    ),
    GoRoute(
      path: '/${RouteNames.settings}',
      name: RouteNames.settings,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: RouteNames.privacy,
          name: RouteNames.privacy,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
); */