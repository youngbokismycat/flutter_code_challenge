import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/settings/account/view_model.dart/theme_config_vm.dart';
import 'package:tread_clone_assignment/features/settings/account/views/widgets/back_leading_button.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: const BackLeadingButton(),
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
        value: ref.watch(themeConfigProvider).darkmode,
        onChanged: (value) {
          ref.read(themeConfigProvider.notifier).setDarkmode(value);
        },
      ),
    );
  }
}
