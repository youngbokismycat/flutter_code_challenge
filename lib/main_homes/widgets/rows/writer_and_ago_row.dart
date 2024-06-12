import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/consts/custom_text_style.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';

class WriterAndAgoRow extends StatelessWidget {
  final int index;
  const WriterAndAgoRow({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final info = ApiService.infos[index];
    return Row(
      children: [
        Text(
          info['name'],
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Gaps.h5,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Opacity(
            opacity: info['verified'] ? 1 : 0,
            child: SvgPicture.asset(
              ApiService.verifiedSVGPath,
              width: 15,
            ),
          ),
        ),
        const Spacer(),
        Text(
          info['ago'],
          style: CustomTextStyle.greyBodyMidium,
        ),
        Gaps.h14,
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: FaIcon(
            FontAwesomeIcons.ellipsis,
            size: 18,
          ),
        ),
      ],
    );
  }
}
