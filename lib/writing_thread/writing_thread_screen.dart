import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/main_homes/widgets/profiles/circular_profile.dart';

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
  Size? columnSize;
  Offset? offset;

  Size? getSize() {
    if (_commentskey.currentContext != null) {
      final RenderBox renderBox =
          _commentskey.currentContext!.findRenderObject() as RenderBox;
      Size columnSize = renderBox.size;
      return columnSize;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
      setState(() {
        columnSize = getSize();
      });
    });
  }

  void _onChanged() {
    _controller.value.text.isEmpty
        ? _isPostEnabled = false
        : _isPostEnabled = true;
    setState(() {
      columnSize = getSize();
    });
  }

  void _onPostTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final double dividerHeight =
        columnSize?.height != null ? columnSize!.height - 40 : 0;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
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
            WriterToWriterColumn(
              onChanged: _onChanged,
              dividerHeight: dividerHeight,
              commentskey: _commentskey,
              controller: _controller,
              focusNode: _focusNode,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 18,
              ),
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.blueAccent,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WriterToWriterColumn extends StatelessWidget {
  const WriterToWriterColumn({
    super.key,
    required this.dividerHeight,
    required GlobalKey<State<StatefulWidget>> commentskey,
    required TextEditingController controller,
    required FocusNode focusNode,
    required this.onChanged,
  })  : _commentskey = commentskey,
        _controller = controller,
        _focusNode = focusNode;

  final double dividerHeight;
  final GlobalKey<State<StatefulWidget>> _commentskey;
  final TextEditingController _controller;
  final FocusNode _focusNode;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: Sizes.size20,
                foregroundImage: AssetImage(
                  "assets/images/default_profile.webp",
                ),
              ),
              Gaps.v10,
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.easeOut,
                constraints: BoxConstraints(
                  minHeight: dividerHeight,
                ),
                width: 2,
                color: Theme.of(context).dividerColor.withOpacity(0.5),
              ),
              Opacity(
                opacity: 0.5,
                child: Transform.scale(
                  scale: 0.5,
                  child: const CircleAvatar(
                    radius: Sizes.size20,
                    foregroundImage: AssetImage(
                      "assets/images/default_profile.webp",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gaps.h10,
          Expanded(
            child: Column(
              key: _commentskey,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "jane_mobbin",
                ),
                TextField(
                  onChanged: (value) => onChanged(),
                  cursorColor: Colors.blue.shade800,
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: "Start a thread...",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black.withOpacity(
                            0.4,
                          ),
                          fontWeight: FontWeight.w400,
                        ),
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
                Gaps.v10,
                const Opacity(
                  opacity: 0.5,
                  child: FaIcon(
                    FontAwesomeIcons.link,
                    size: Sizes.size18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetAppbar extends StatelessWidget {
  const BottomSheetAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 4,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "New thread",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
