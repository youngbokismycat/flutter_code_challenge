import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
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
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                "assets/images/default_profile.webp",
              ),
              foregroundImage: NetworkImage(
                getImage(),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: getBoolean() && getBoolean() && getBoolean() ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: getColor(),
                    ),
                  ),
                ),
              ),
            )
          ],
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
            Row(
              children: [
                if (getBoolean() && getBoolean())
                  Padding(
                    padding: const EdgeInsets.only(right: Sizes.size24),
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          foregroundImage: NetworkImage(
                            getImage(),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              child: CircleAvatar(
                                radius: 10,
                                foregroundImage: NetworkImage(
                                  getImage(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Text(
                  "${randomNum()} followers",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            )
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
            border: Border.all(
              width: 1.3,
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Text(
            "Follow",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
