import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/utils.dart';

class ActivityProfileListTile extends StatelessWidget {
  const ActivityProfileListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      isThreeLine: true,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          const CircleProfileNoNeedPathOrIndex(),
          Positioned(
            right: -3,
            bottom: -3,
            child: Container(
              height: 23,
              width: 23,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.83,
                heightFactor: 0.83,
                child: CircleAvatar(
                  backgroundColor: getColor(),
                  child: FaIcon(
                    getIcon(),
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              faker.person.name().replaceAll(r' ', "_").toLowerCase(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 0,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Gaps.h5,
            Opacity(
              opacity: 0.5,
              child: Text(
                "${getInt()}h",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      height: 0,
                    ),
              ),
            )
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Text(
              getBoolean()
                  ? "Mentioned you"
                  : getBoolean()
                      ? "Followed you"
                      : faker.lorem.sentence(),
              maxLines: 1,
              textScaler: const TextScaler.linear(
                0.9,
              ),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.normal, height: 1.5),
            ),
          ),
          if (getBoolean())
            Text(
              faker.lorem.sentence(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
      trailing: getBoolean()
          ? getBoolean()
              ? FollowButton(
                  isFollow: getBoolean(),
                  isFilled: false,
                )
              : null
          : null,
    );
  }
}
