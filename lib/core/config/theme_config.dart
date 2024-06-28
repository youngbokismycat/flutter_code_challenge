import 'package:flutter/material.dart';

class ThemeConfig extends ChangeNotifier {
  bool isDarkMode = true;

  void toggleIsDarkmode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
