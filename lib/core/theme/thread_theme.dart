import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/theme/thread_colors.dart';

abstract class ThreadTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      dividerColor: const Color(0xFFdad9d9),
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
          fontSize: 17.0,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 17.0,
          letterSpacing: -0.1,
        ),
      ),
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Theme.of(context).dividerColor,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ThreadColors.darkBgColor,
      ),
      scaffoldBackgroundColor: ThreadColors.darkBgColor,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color.fromARGB(255, 20, 20, 20),
        surfaceTintColor: Colors.black,
      ),
      dividerColor: const Color(0xFFdad9d9),
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
          fontSize: 17.0,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 17.0,
          letterSpacing: -0.1,
        ),
      ),
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Theme.of(context).dividerColor.withOpacity(0.5),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
    );
  }
}
