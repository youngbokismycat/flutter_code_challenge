import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/informations.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        isThreeLine: true,
        leading: const CircleProfileNoNeedPathOrIndex(
          isHaveBorder: false,
          radius: Sizes.size20,
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                faker.person.name().toLowerCase().replaceAll(RegExp(r' '), ""),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
              ),
              Gaps.h5,
              Opacity(
                opacity: getBoolean() ? 1 : 0,
                child: SvgPicture.asset(
                  Informations.verifiedSVGPath,
                  width: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.4,
              child: Text(
                faker.person.name(),
                textScaler: const TextScaler.linear(0.9),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            Gaps.v6,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (getBoolean() && getBoolean())
                    StackedTwoProfiles(
                      backgroundColor: isDarkMode(context)
                          ? const Color.fromARGB(255, 22, 22, 22)
                          : Colors.white,
                    ),
                  Text(
                    "${getNum()} followers",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: const FollowButton(
          isFollow: false,
          isFilled: false,
        ),
      ),
    );
  }
}
