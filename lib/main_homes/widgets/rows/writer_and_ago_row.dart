import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/main_homes/pop_up_screens/i_hate_you_screen.dart';

class WriterAndAgoRow extends StatelessWidget {
  final int index;
  const WriterAndAgoRow({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void onElipsisTap(BuildContext context) {
      showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(
          0.7,
        ),
        constraints: BoxConstraints(
          maxHeight: size.height * 0.35,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.size16),
        ),
        context: context,
        builder: (context) => const IHateYouScreen(),
      );
    }

    final info = Informations.infos[index];
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          Text(
            faker.person.name(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Gaps.h5,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Opacity(
              opacity: info['verified'] ? 1 : 0,
              child: SvgPicture.asset(
                Informations.verifiedSVGPath,
                width: 15,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                info['ago'],
                style: CustomTextStyle.greyBodyMidium,
              ),
              Gaps.h14,
              GestureDetector(
                onTap: () => onElipsisTap(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: FaIcon(
                    FontAwesomeIcons.ellipsis,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
