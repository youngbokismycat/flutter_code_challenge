import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/theme/thread_colors.dart';
import 'package:tread_clone_assignment/features/authentication/widgets/auth_textfield.dart';
import 'package:tread_clone_assignment/features/common/widgets/default_padding.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      backgroundColor: isDarkMode(ref)
          ? ThreadColors.darkBgColor
          : ThreadColors.lightBgColor,
      appBar: AppBar(
        backgroundColor: isDarkMode(ref)
            ? ThreadColors.darkBgColor
            : ThreadColors.lightBgColor,
        title: Opacity(
          opacity: 0.6,
          child: Text(
            'Endlish (US)',
            style: Theme.of(context).textTheme.bodySmall,
            textScaler: const TextScaler.linear(
              0.8,
            ),
          ),
        ),
      ),
      body: DefaultPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size10,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode(ref) ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(
                        Sizes.size20,
                      ),
                    ),
                    child: SvgPicture.asset(
                      Informations.threadsLogoPath,
                      width: 60,
                      height: 60,
                      color: isDarkMode(ref) ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AuthTextfield(
                        hintText: 'Mobile number or email',
                      ),
                      Gaps.v14,
                      const AuthTextfield(
                        hintText: 'Password',
                      ),
                      Gaps.v14,
                      RoundedButton(
                        text: 'Log in',
                        textColor: Colors.white,
                        color: ThreadColors.lightBlueColor,
                        verticalPadding: Sizes.size16,
                        onPressed: () {},
                      ),
                      Gaps.v14,
                      const Text(
                        "Forgot password?",
                        textScaler: TextScaler.linear(
                          0.9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundedButton(
                      text: 'Create new account',
                      textColor: Colors.black,
                      verticalPadding: Sizes.size7,
                      borderColor:
                          Theme.of(context).disabledColor.withOpacity(0.2),
                      onPressed: () {},
                    ),
                    Gaps.v14,
                    const Opacity(
                      opacity: 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.meta,
                          ),
                          Gaps.h5,
                          Text(
                            "Meta",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final double verticalPadding;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.transparent,
    this.textColor = Colors.black,
    this.borderColor = Colors.transparent,
    required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          Sizes.size5,
        ),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
