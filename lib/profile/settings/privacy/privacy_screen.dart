import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy',
          textScaler: const TextScaler.linear(1.2),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: DefaultPadding(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                  size: 18,
                ),
                Gaps.h5,
                Text(
                  "Back",
                  style: Theme.of(context).textTheme.bodySmall,
                  textScaler: const TextScaler.linear(1.2),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: Text(
              'Private profile',
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
            value: _isPrivateProfile,
            activeColor: isDarkMode(context) ? Colors.black : Colors.white,
            activeTrackColor: isDarkMode(context) ? Colors.teal : Colors.black,
            onChanged: (bool value) {
              setState(() {
                _isPrivateProfile = value;
              });
            },
            secondary: Icon(
              Icons.lock,
              color: isDarkMode(context) ? Colors.white : Colors.black,
            ),
          ),
          PrivacyListTile(
            title: 'Mentions',
            icon: Icons.alternate_email,
            trailing: Text(
              "Everyone",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                  ),
            ),
            onTap: () {
              // Handle tap action
            },
          ),
          PrivacyListTile(
            title: 'Muted',
            icon: Icons.volume_off,
            onTap: () {
              // Handle tap action
            },
          ),
          PrivacyListTile(
            title: 'Hidden Words',
            icon: Icons.visibility_off,
            onTap: () {
              // Handle tap action
            },
          ),
          PrivacyListTile(
            title: 'Profiles you follow',
            icon: Icons.people,
            onTap: () {
              // Handle tap action
            },
          ),
          Divider(
            color: Theme.of(context).dividerColor.withOpacity(
                  0.5,
                ),
          ),
          ListTile(
            isThreeLine: true,
            title: Text(
              "Other privacy settings",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Opacity(
              opacity: 0.4,
              child: Text(
                "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            trailing: const Opacity(
              opacity: 0.4,
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: 18,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.circleXmark,
            ),
            title: Text(
              "Other privacy settings",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Opacity(
              opacity: 0.4,
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: 18,
              ),
            ),
          ),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.heartCircleXmark,
            ),
            title: Text(
              "Hide likes",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Opacity(
              opacity: 0.4,
              child: FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback onTap;

  const PrivacyListTile({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.icon,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isDarkMode(context) ? Colors.white : Colors.black,
        ),
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      leading: Icon(
        icon,
        color: isDarkMode(context) ? Colors.white : Colors.black,
      ),
      trailing: Opacity(
        opacity: 0.4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null) trailing!,
            Gaps.h10,
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
