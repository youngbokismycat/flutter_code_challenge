import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/features/main_home/pop_up_screens/widgets/hateness_container.dart';
import 'package:tread_clone_assignment/features/main_home/pop_up_screens/widgets/stick_handler.dart';

class IHateYouScreen extends StatelessWidget {
  const IHateYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                StickHandler(),
                HatenessContainer(
                  firstHateness: "Unfollow",
                  secondHateness: "Mute",
                ),
                HatenessContainer(
                  firstHateness: "Hide",
                  secondHateness: "Report",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
