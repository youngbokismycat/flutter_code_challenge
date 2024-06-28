import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/features/settings/account/model/theme_config_model.dart';
import 'package:tread_clone_assignment/features/settings/account/repo/theme_config_repo.dart';

class ThemeConfigViewModel extends ChangeNotifier {
  final ThemeConfigRepository _repository;
  ThemeConfigViewModel(this._repository);
  late final ThemeConfigModel _model = ThemeConfigModel(
    darkmode: _repository.isDarkmode(),
  );

  bool get darkmode => _model.darkmode;

  void setDarkmode(bool value) {
    _repository.setDarkMode(value);
    _model.darkmode = value;
    notifyListeners();
  }
}
