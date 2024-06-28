import 'package:shared_preferences/shared_preferences.dart';

class ThemeConfigRepository {
  static const _darkmode = "darkmode";
  final SharedPreferences _preferences;

  ThemeConfigRepository(this._preferences);

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkmode, value);
  }

  bool isDarkmode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
