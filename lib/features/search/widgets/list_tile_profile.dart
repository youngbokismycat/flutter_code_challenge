import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tread_clone_assignment/features/commons/widgets/circle_profile_no_index_or_path.dart';
import 'package:tread_clone_assignment/features/commons/widgets/default_padding.dart';
import 'package:tread_clone_assignment/features/commons/widgets/follow_button.dart';
import 'package:tread_clone_assignment/features/commons/widgets/stacked_two_profile.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';

class ListTileProfile extends ConsumerWidget {
  const ListTileProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      backgroundColor: isDarkMode(ref)
                          ? const Color.fromARGB(255, 20, 20, 20)
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
