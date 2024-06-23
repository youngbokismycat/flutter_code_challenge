import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';
import 'package:tread_clone_assignment/main_navigations/main_navigation_screen.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() {
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isDarkMode(context)
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    );
    return MaterialApp(
      themeMode: ThemeMode.system,
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      title: 'Thread Clone',
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
          color: Color.fromARGB(255, 22, 22, 22),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color.fromARGB(255, 22, 22, 22),
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
