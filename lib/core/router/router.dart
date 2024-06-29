import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/authentication/sign_in_screen.dart';

import 'package:tread_clone_assignment/features/common/main_navigations/main_navigation_screen.dart';
import 'package:tread_clone_assignment/features/settings/account/views/account_screen.dart';
import 'package:tread_clone_assignment/features/settings/privacy/privacy_screen.dart';
import 'package:tread_clone_assignment/features/settings/settings_screen.dart';

final routeObserverProvider = RouteObserver<ModalRoute<void>>();

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: '/${RouteNames.authentication}',
      routes: [
        GoRoute(
          path: "/${RouteNames.authentication}",
          name: RouteNames.authentication,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: '/:tab(home|search|activity|profile)',
          name: RouteNames.mainNavigationRouteName,
          builder: (context, state) =>
              MainNavigationScreen(tab: state.params['tab']!),
          routes: [
            GoRoute(
              path: RouteNames.settingsRouteName,
              name: RouteNames.settingsRouteName,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: RouteNames.privacyRouteName,
                  name: RouteNames.privacyRouteName,
                  builder: (context, state) => const PrivacyScreen(),
                ),
                GoRoute(
                  path: RouteNames.accountRouteName,
                  name: RouteNames.accountRouteName,
                  builder: (context, state) => const AccountScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
