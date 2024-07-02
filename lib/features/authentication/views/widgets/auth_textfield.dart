import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class AuthTextfield extends ConsumerWidget {
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const AuthTextfield({
    super.key,
    this.obscureText = false,
    required this.validator,
    required this.onSaved,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OutlineInputBorder authOutLineInputBorder() {
      return OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).disabledColor.withOpacity(0.2),
        ),
      );
    }

    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      keyboardAppearance: isDarkMode(ref) ? Brightness.dark : Brightness.light,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isDarkMode(ref) ? Colors.grey.shade400 : Colors.black,
          ),
      cursorColor: isDarkMode(ref)
          ? Colors.grey.shade400
          : Theme.of(context).disabledColor.withOpacity(0.55),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDarkMode(ref) ? Colors.grey.shade800 : Colors.white,
        enabledBorder: authOutLineInputBorder(),
        focusedBorder: authOutLineInputBorder(),
        errorBorder: authOutLineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size18,
          horizontal: Sizes.size14,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              letterSpacing: 0.6,
              color: isDarkMode(ref)
                  ? Colors.grey.shade400
                  : Theme.of(context).disabledColor.withOpacity(
                        0.4,
                      ),
            ),
      ),
    );
  }
}
