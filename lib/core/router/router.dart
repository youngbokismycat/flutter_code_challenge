import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/authentication/repos/authentication_repo.dart';
import 'package:tread_clone_assignment/features/authentication/views/create_account_screen.dart';
import 'package:tread_clone_assignment/features/authentication/views/sign_in_screen.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';

import 'package:tread_clone_assignment/features/common/view/main_navigations/main_navigation_screen.dart';
import 'package:tread_clone_assignment/features/search/view/search_thread_screen.dart';
import 'package:tread_clone_assignment/features/settings/account/views/account_screen.dart';
import 'package:tread_clone_assignment/features/settings/privacy/privacy_screen.dart';
import 'package:tread_clone_assignment/features/settings/settings_screen.dart';

final routeObserverProvider = RouteObserver<ModalRoute<void>>();

final routerProvider = Provider(
  (ref) {
    ref.watch(authState);
    return GoRouter(
      initialLocation: '/home',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggIn;
        if (!isLoggedIn) {
          if (state.subloc != "/${RouteNames.signUpRouteName}" &&
              state.subloc != "/${RouteNames.createAccountRouteName}") {
            return "/${RouteNames.signUpRouteName}";
          }
        }

        return null;
      },
      routes: [
        GoRoute(
          path: "/${RouteNames.signUpRouteName}",
          name: RouteNames.signUpRouteName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: "/${RouteNames.createAccountRouteName}",
          name: RouteNames.createAccountRouteName,
          builder: (context, state) => const CreateAccountScreen(),
        ),
        GoRoute(
          path: '/:tab(home|search|activity|profile)',
          name: RouteNames.mainNavigationRouteName,
          builder: (context, state) =>
              MainNavigationScreen(tab: state.params['tab']!),
          routes: [
            GoRoute(
              path: RouteNames.searchThread,
              name: RouteNames.searchThread,
              builder: (context, state) {
                final Map<String, dynamic> extraData =
                    state.extra as Map<String, dynamic>;
                final String initialText = extraData['initialText'] as String;
                final List<ThreadModel> results =
                    extraData['results'] as List<ThreadModel>;
                return SearchThreadScreen(
                  initialText: initialText,
                  results: results,
                );
              },
            ),
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
