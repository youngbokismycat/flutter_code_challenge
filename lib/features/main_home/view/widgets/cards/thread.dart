import 'package:flutter/material.dart';

import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/columns/content_column.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/columns/writer_to_repliers_column.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';

class Thread extends StatefulWidget {
  final int index;
  final ThreadModel threadData;
  const Thread({
    super.key,
    required this.index,
    required this.threadData,
  });

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  final GlobalKey _contentskey = GlobalKey();

  Size? columnSize;
  Offset? offset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        columnSize = getSize();
      });
    });
  }

  Size? getSize() {
    if (_contentskey.currentContext != null) {
      final RenderBox renderBox =
          _contentskey.currentContext!.findRenderObject() as RenderBox;
      Size columnSize = renderBox.size;
      return columnSize;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WriterRepliersColumn(
            index: widget.index,
            contentsHeight: columnSize?.height,
            threadData: widget.threadData,
          ),
          Gaps.h10,
          ContentsColumn(
            key: _contentskey,
            index: widget.index,
            threadData: widget.threadData,
          ),
        ],
      ),
    );
  }
}
