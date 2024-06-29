import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/features/common/widgets/four_buttons.dart';
import 'package:tread_clone_assignment/core/consts/informations.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/features/main_home/widgets/pageviews/landscape_pageview.dart';
import 'package:tread_clone_assignment/features/main_home/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/features/main_home/widgets/rows/writer_and_ago_row.dart';

class ContentsColumn extends StatelessWidget {
  const ContentsColumn({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final info = Informations.infos[index];
    final List<dynamic>? images = info['landscape'];

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterAndAgoRow(
            index: index,
          ),
          Text(
            info['content'],
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (images!.isNotEmpty) ...[
            Gaps.v10,
            LandscapePageView(
              index: index,
            ),
          ],
          Gaps.v10,
          const FourButtons(),
          Gaps.v16,
          RepliesAndLikesRow(index: index),
        ],
      ),
    );
  }
}
