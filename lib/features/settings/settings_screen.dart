import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/authentication/repos/authentication_repo.dart';
import 'package:tread_clone_assignment/features/common/widgets/default_padding.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/settings/account/views/widgets/back_leading_button.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(ref);
    final theme = Theme.of(context);

    final dialogTitle = Text(
      'Logout',
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
    );

    final dialogContent = Text(
      'Are you sure you want to logout?',
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
    );

    final cancelButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStyle(color: isDark ? Colors.blue : Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    final logoutButton = TextButton(
      child: Text(
        'Logout',
        style: TextStyle(color: isDark ? Colors.blue : Colors.red),
      ),
      onPressed: () {
        ref.read(authRepo).signOut();
      },
    );

    if (theme.platform == TargetPlatform.iOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: dialogTitle,
          content: dialogContent,
          actions: <Widget>[
            CupertinoDialogAction(
              child: cancelButton,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: logoutButton,
              onPressed: () {
                ref.read(authRepo).signOut();
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: isDark ? Colors.grey[850] : Colors.white,
          title: dialogTitle,
          content: dialogContent,
          actions: <Widget>[
            cancelButton,
            logoutButton,
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: const BackLeadingButton(),
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyMedium,
          textScaleFactor: 1.2,
        ),
      ),
      body: ListView(
        children: [
          const CustomListTile(
            icon: FontAwesomeIcons.userPlus,
            text: 'Follow and invite friends',
          ),
          const CustomListTile(
            icon: FontAwesomeIcons.bell,
            text: 'Notifications',
          ),
          CustomListTile(
            icon: FontAwesomeIcons.lock,
            text: 'Privacy',
            onTap: () => context.go(
              "/${RouteNames.mainNavigationRoutes[4]}/${RouteNames.settingsRouteName}/${RouteNames.privacyRouteName}",
            ),
          ),
          CustomListTile(
            icon: FontAwesomeIcons.user,
            text: 'Account',
            onTap: () => context.go(
              "/${RouteNames.mainNavigationRoutes[4]}/${RouteNames.settingsRouteName}/${RouteNames.accountRouteName}",
            ),
          ),
          const CustomListTile(
            icon: FontAwesomeIcons.questionCircle,
            text: 'Help',
          ),
          const CustomListTile(
            icon: FontAwesomeIcons.infoCircle,
            text: 'About',
          ),
          Divider(
            color: Theme.of(context).dividerColor.withOpacity(
                  0.5,
                ),
          ),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              _showLogoutDialog(context, ref);
            },
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends ConsumerWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: isDarkMode(ref) ? Colors.white : Colors.black,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: Sizes.size18,
            ),
      ),
      onTap: onTap,
    );
  }
}
