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
import 'package:tread_clone_assignment/features/authentication/view_models/signup_vm.dart';
import 'package:tread_clone_assignment/features/authentication/views/widgets/auth_textfield.dart';
import 'package:tread_clone_assignment/features/authentication/views/widgets/rounded_button.dart';
import 'package:tread_clone_assignment/features/common/view/widgets/default_padding.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  CreateAccountScreenState createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  final RegExp passwordRegExp = RegExp(
    r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&\^])[A-Za-z\d@$!%*#?&\^]{3,}$",
  );

  final Map<String, String> _account = {};

  void onLogInTap(BuildContext context) {
    context.pop();
  }

  String? _emailValidator(String? value) {
    if (value == null) {
      return "Please write your email";
    } else if (emailRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Invalid email address detected';
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null) {
      return "Please write your password";
    } else if (passwordRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Invalid password detected';
    }
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

  void onCreateAccountTap() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(signUpForm.notifier).state = _account;
      ref.read(signUpProvider.notifier).signUp(context);
    }
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
                        text: 'Create account',
                        textColor: Colors.white,
                        color: ThreadColors.lightBlueColor,
                        verticalPadding: Sizes.size16,
                        disabled: ref.watch(signUpProvider).isLoading,
                        onPressed: () => onCreateAccountTap(),
                      ),
                      Gaps.v14,
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
                        text: 'Back to log in',
                        textColor: Colors.black,
                        verticalPadding: Sizes.size7,
                        borderColor:
                            Theme.of(context).disabledColor.withOpacity(0.2),
                        onPressed: () => onLogInTap(context),
                      ),
                      Gaps.v14,
                      const Opacity(
                        opacity: 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.meta,
                              color: Colors.grey,
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
