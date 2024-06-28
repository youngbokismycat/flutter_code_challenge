import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/commons/widgets/default_padding.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/settings/account/views/account_screen.dart';
import 'package:tread_clone_assignment/features/settings/privacy/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  void _showLogoutDialog(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text('Logout'),
              onPressed: () {
                // Handle the logout action
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                // Handle the logout action
                Navigator.of(context).pop();
              },
            ),
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
        leading: DefaultPadding(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: Sizes.size18,
                ),
                Gaps.h5,
                Text(
                  "Back",
                  style: Theme.of(context).textTheme.bodySmall,
                  textScaleFactor: 1.2,
                ),
              ],
            ),
          ),
        ),
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrivacyScreen(),
              ),
            ),
          ),
          CustomListTile(
            icon: FontAwesomeIcons.user,
            text: 'Account',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
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
              _showLogoutDialog(context);
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
