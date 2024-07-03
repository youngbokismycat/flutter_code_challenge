import 'package:flutter/material.dart';

import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/features/common/widgets/four_buttons.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/pageviews/landscape_pageview.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/rows/replies_and_likes_row.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/rows/writer_and_ago_row.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';

class ContentsColumn extends StatelessWidget {
  const ContentsColumn({
    super.key,
    required this.threadData,
    required this.index,
  });
  final ThreadModel threadData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterAndAgoRow(
            index: index,
            threadData: threadData,
          ),
          if (threadData.thread != null)
            Text(
              threadData.thread!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          Gaps.v10,
          LandscapePageView(
            index: index,
            threadData: threadData,
          ),
          Gaps.v10,
          const FourButtons(),
          Gaps.v16,
          RepliesAndLikesRow(
            index: index,
            replies: threadData.replies,
            likes: threadData.likes,
          ),
        ],
      ),
    );
  }
}
