import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/core/config/theme_config.dart';
import 'package:tread_clone_assignment/features/settings/account/model/theme_config_model.dart';
import 'package:tread_clone_assignment/features/settings/account/repo/theme_config_repo.dart';

class ThemeConfigViewModel extends Notifier<ThemeConfigModel> {
  final ThemeConfigRepository _repository;
  ThemeConfigViewModel(this._repository);

  void setDarkmode(bool value) {
    _repository.setDarkMode(value);
    state = ThemeConfigModel(darkmode: value);
  }

  @override
  ThemeConfigModel build() {
    return ThemeConfigModel(
      darkmode: _repository.isDarkmode(),
    );
  }
}

final themeConfigProvider =
    NotifierProvider<ThemeConfigViewModel, ThemeConfigModel>(
  () => throw UnimplementedError(),
);
