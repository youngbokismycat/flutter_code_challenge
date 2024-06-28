import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tread_clone_assignment/core/config/theme_config.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/router/router.dart';
import 'package:tread_clone_assignment/features/commons/main_navigations/main_navigation_screen.dart';
import 'package:tread_clone_assignment/features/settings/account/repo/theme_config_repo.dart';
import 'package:tread_clone_assignment/features/settings/account/view_model.dart/theme_config_vm.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        themeConfigProvider.overrideWith(
          () => ThemeConfigViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode(ref) ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
    setState(() {});
    return MaterialApp(
      navigatorObservers: [routeObserver],
      themeMode: ref.watch(themeConfigProvider).darkmode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Thread Clomne',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        dividerColor: const Color(
          0xFFdad9d9,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: Sizes.size28,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: Sizes.size20,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
            letterSpacing: -0.1,
          ),
        ),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Theme.of(context).dividerColor,
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color.fromARGB(255, 20, 20, 20),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromARGB(255, 20, 20, 20),
          surfaceTintColor: Colors.black,
        ),
        dividerColor: const Color(
          0xFFdad9d9,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: Sizes.size28,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: Sizes.size20,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 17,
            letterSpacing: -0.1,
          ),
        ),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Theme.of(context).dividerColor.withOpacity(
                0.5,
              ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
