import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/main_navigations/main_navigation_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );
  runApp(DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: const MainNavigationScreen(),
    );
  }
}
