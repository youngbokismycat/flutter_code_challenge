import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tread_clone_assignment/core/config/theme_config.dart';
import 'package:tread_clone_assignment/features/settings/account/view_model.dart/theme_config_vm.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: Theme.of(context).textTheme.bodyMedium,
          textScaler: const TextScaler.linear(
            1.2,
          ),
        ),
      ),
      body: SwitchListTile.adaptive(
        title: Text(
          "Chage Theme",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Opacity(
          opacity: 0.4,
          child: Text(
            'you can change your theme',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        value: context.watch<ThemeConfigViewModel>().darkmode,
        onChanged: (value) =>
            context.read<ThemeConfigViewModel>().setDarkmode(value),
      ),
    );
  }
}
