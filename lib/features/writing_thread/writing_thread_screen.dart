import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/writing_thread/widgets/bottom_sheet_appbar.dart';
import 'package:tread_clone_assignment/features/writing_thread/widgets/write_thread.dart';

class WritingThreadScreen extends StatefulWidget {
  const WritingThreadScreen({super.key});

  @override
  State<WritingThreadScreen> createState() => _WritingThreadScreenState();
}

class _WritingThreadScreenState extends State<WritingThreadScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _commentskey = GlobalKey();

  bool _isPostEnabled = false;
  Size? widgetSize;
  Size? contentSize;
  Offset? offset;

  Size? getSize(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      Size widgetSize = renderBox.size;
      return widgetSize;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
      widgetSize = getSize(_commentskey);
    });
  }

  void _onChanged() async {
    _controller.value.text.isEmpty
        ? _isPostEnabled = false
        : _isPostEnabled = true;

    await Future.delayed(
      const Duration(
        milliseconds: 25,
      ),
    );
    setState(() {
      widgetSize = getSize(_commentskey);
    });
  }

  void _onPostTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double dividerHeight =
        widgetSize?.height != null ? widgetSize!.height - 40 : 0;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        builder: (context, scrollController) => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BottomSheetAppbar(),
                  Divider(
                    color: Theme.of(context).dividerColor.withOpacity(
                          0.5,
                        ),
                    height: 1,
                  ),
                  Gaps.v10,
                  WriteThread(
                    onChanged: _onChanged,
                    dividerHeight: dividerHeight,
                    commentskey: _commentskey,
                    controller: _controller,
                    focusNode: _focusNode,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                color:
                    isDarkMode(context) ? Colors.grey.shade900 : Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Text(
                        "Anyone can reply",
                        textScaler: const TextScaler.linear(
                          0.9,
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    GestureDetector(
                      onTap: _isPostEnabled ? _onPostTap : null,
                      child: Opacity(
                        opacity: _isPostEnabled ? 1 : 0.5,
                        child: Text(
                          "Post",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blueAccent,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
