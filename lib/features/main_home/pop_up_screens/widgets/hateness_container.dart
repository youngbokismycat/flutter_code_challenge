import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/features/main_home/view/pop_up_screens/widgets/i_hate_you_button.dart';

class HatenessContainer extends StatelessWidget {
  final String secondHateness;
  final String firstHateness;

  const HatenessContainer({
    super.key,
    required this.firstHateness,
    required this.secondHateness,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size10,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size20,
            ),
            color: Theme.of(context).dividerColor.withOpacity(
                  0.2,
                ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IHateYouButton(
                hateness: firstHateness,
              ),
              Divider(
                color: Theme.of(context).dividerColor.withOpacity(
                      0.5,
                    ),
                height: 0,
              ),
              IHateYouButton(
                hateness: secondHateness,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
