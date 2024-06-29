import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class AuthTextfield extends ConsumerWidget {
  final String hintText;
  const AuthTextfield({
    super.key,
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
      cursorColor: Theme.of(context).disabledColor.withOpacity(0.55),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDarkMode(ref) ? Colors.grey.shade800 : Colors.white,
        enabledBorder: authOutLineInputBorder(),
        focusedBorder: authOutLineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size18,
          horizontal: Sizes.size14,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              letterSpacing: 0.6,
              color: Theme.of(context).disabledColor.withOpacity(
                    0.4,
                  ),
            ),
      ),
    );
  }
}
