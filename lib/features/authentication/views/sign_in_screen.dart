import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/core/theme/thread_colors.dart';
import 'package:tread_clone_assignment/features/authentication/view_models/signin_vm.dart';
import 'package:tread_clone_assignment/features/authentication/views/widgets/auth_textfield.dart';
import 'package:tread_clone_assignment/features/authentication/views/widgets/rounded_button.dart';
import 'package:tread_clone_assignment/features/common/widgets/default_padding.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _account = {};

  String? _emailValidator(String? value) {
    if (value == null || value == '') {
      return "Please write your email";
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value == '') {
      return "Please write your password";
    }
    return null;
  }

  void _emailOnSaved(String? newValue) {
    if (newValue != null) {
      _account['email'] = newValue;
    }
  }

  void _passwordOnSaved(String? newValue) {
    if (newValue != null) {
      _account['password'] = newValue;
    }
  }

  void onLoginTap() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentContext != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref
            .read(loginProvider.notifier)
            .signin(_account['email']!, _account['password']!, context);
      }
    }
  }

  void onCreateNewAccountTap(BuildContext context) {
    context.pushNamed(RouteNames.createAccountRouteName);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AuthTextfield(
                        validator: _emailValidator,
                        onSaved: _emailOnSaved,
                        hintText: 'Mobile number or email',
                      ),
                      Gaps.v14,
                      AuthTextfield(
                        validator: _passwordValidator,
                        onSaved: _passwordOnSaved,
                        obscureText: true,
                        hintText: 'Password',
                      ),
                      Gaps.v14,
                      RoundedButton(
                        text: 'Log in',
                        textColor: Colors.white,
                        color: ThreadColors.lightBlueColor,
                        verticalPadding: Sizes.size16,
                        disabled: ref.watch(loginProvider).isLoading,
                        onPressed: () => onLoginTap(),
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
              Flexible(
                flex: 2,
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
                        onPressed: () => onCreateNewAccountTap(context),
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
      ),
    );
  }
}
