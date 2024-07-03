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
  final GlobalKey _contentsKey = GlobalKey();
  Size? columnSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkSizeChange();
    });
  }

  @override
  void didUpdateWidget(covariant Thread oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkSizeChange();
    });
  }

  void _checkSizeChange() {
    final newSize = getSize();
    if (newSize != columnSize) {
      columnSize = newSize;
      _onSizeChanged(newSize);
      setState(() {});
    }
  }

  Size? getSize() {
    if (_contentsKey.currentContext != null) {
      final RenderBox renderBox =
          _contentsKey.currentContext!.findRenderObject() as RenderBox;
      return renderBox.size;
    }
    return null;
  }

  void _onSizeChanged(Size? newSize) {
    if (newSize != null) {
      columnSize = newSize;
      setState(() {});
    }
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
            key: _contentsKey,
            index: widget.index,
            threadData: widget.threadData,
          ),
        ],
      ),
    );
  }
}
