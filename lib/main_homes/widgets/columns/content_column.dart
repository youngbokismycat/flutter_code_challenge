import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/consts/api_service.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/main_homes/widgets/buttons/four_buttons.dart';
import 'package:tread_clone_assignment/main_homes/widgets/pageviews/landscape_pageview.dart';
import 'package:tread_clone_assignment/main_homes/widgets/post_threads_section.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/main_homes/widgets/rows/writer_and_ago_row.dart';

class ContentsColumn extends StatelessWidget {
  const ContentsColumn({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final info = ApiService.infos[index];
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
            )
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
