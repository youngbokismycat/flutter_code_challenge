import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/main_navigations/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: const MainNavigationScreen(),
    );
  }
}
