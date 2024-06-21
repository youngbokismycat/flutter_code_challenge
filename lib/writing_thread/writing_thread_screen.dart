import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tread_clone_assignment/consts/gaps.dart';
import 'package:tread_clone_assignment/consts/sizes.dart';
import 'package:tread_clone_assignment/main.dart';
import 'package:tread_clone_assignment/taking_pictures/preview/preview_screen.dart';

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
                color: Colors.white,
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

class WriteThread extends StatefulWidget {
  const WriteThread({
    super.key,
    required this.dividerHeight,
    required this.commentskey,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final double dividerHeight;

  final GlobalKey<State<StatefulWidget>> commentskey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onChanged;

  @override
  State<WriteThread> createState() => _WriteThreadState();
}

class _WriteThreadState extends State<WriteThread>
    with RouteAware, WidgetsBindingObserver {
  final GlobalKey _contentKey = GlobalKey();
  String? imageOrVideo;
  bool isRecieveResult = false;
  double contentHeight = 0;
  Size? widgetSize;

  double _contentOpacity = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as ModalRoute);
  }

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
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            final size = getSize(_contentKey);
            if (size == null || size.height == 0) {
              return;
            } else {
              contentHeight = size.height;

              setState(() {});
            }
          },
        );
        Future.delayed(const Duration(seconds: 1), () {
          _contentOpacity = 1;
          setState(() {});
        });
      },
    );
  }

  Future<void> _onMediaTap(MediaCapture media) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          media: media,
          path: media.captureRequest.path!,
        ),
      ),
    );
    if (result != null) {
      imageOrVideo = result;
      print(imageOrVideo);
      isRecieveResult = true;
      setState(() {});
    }
  }

  Future<void> _onImagesTap() async {
    FocusScope.of(context).unfocus();
    await Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
    );
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result != null) {
      final tempFile = File(result.path);
      final content = await tempFile.readAsBytes();
      imageOrVideo = result.path;
      final newFile = File(imageOrVideo!);
      await newFile.writeAsBytes(content);
      isRecieveResult = true;

      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              final size = getSize(_contentKey);
              if (size == null || size.height == 0) {
                return;
              } else {
                contentHeight = size.height;

                setState(() {});
              }
            },
          );
          Future.delayed(const Duration(seconds: 1), () {
            _contentOpacity = 1;
            setState(() {});
          });
        },
      );
    }
  }

  void _onPhotoTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photoAndVideo(),
          middleContentBuilder: (state) => Container(),
          onMediaTap: (mediaCapture) {
            _onMediaTap(mediaCapture);
          },
        ),
      ),
    );
  }

  void _deletecontent() {
    isRecieveResult = false;
    imageOrVideo = null;
    contentHeight = 0;
    _contentOpacity = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size10,
        vertical: Sizes.size5,
      ),
      child: Column(
        children: [
          Row(
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
                      milliseconds: 300,
                    ),
                    curve: Curves.easeInOut,
                    height: contentHeight + widget.dividerHeight,
                    width: 2,
                    color: Theme.of(context).dividerColor.withOpacity(0.5),
                  ),
                  Gaps.v10,
                ],
              ),
              Gaps.h10,
              Expanded(
                child: Column(
                  key: widget.commentskey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "jane_mobbin",
                    ),
                    TextField(
                      onChanged: (value) => widget.onChanged(),
                      style: const TextStyle(
                        height: 1.2,
                      ),
                      cursorColor: Colors.black,
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(bottom: 30),
                        hintText: "Start a thread...",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.black.withOpacity(
                                    0.4,
                                  ),
                                  fontWeight: FontWeight.w400,
                                ),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                    Gaps.v24,
                  ],
                ),
              ),
            ],
          ),
          DeferredPointerHandler(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Sizes.size24,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.4,
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
                        Gaps.h10,
                        Opacity(
                          opacity: 0.4,
                          child: Text(
                            'Add to a thread',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(height: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isRecieveResult)
                    Positioned(
                      top: -245,
                      left: 50,
                      child: Stack(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            opacity: _contentOpacity,
                            child: Stack(
                              children: [
                                IgnorePointer(
                                  ignoring: true,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.size10,
                                      ),
                                    ),
                                    child: Image.file(
                                      key: _contentKey,
                                      File(
                                        imageOrVideo!,
                                      ),
                                      scale: 7,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: DeferPointer(
                                      child: GestureDetector(
                                        onTap: _deletecontent,
                                        child: const FaIcon(
                                          FontAwesomeIcons.solidCircleXmark,
                                          size: Sizes.size20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ThreadFileButton(
                    bottom: 50,
                    left: 50,
                    icon: const FaIcon(
                      FontAwesomeIcons.images,
                      size: Sizes.size20,
                    ),
                    onTap: () => _onImagesTap(),
                  ),
                  ThreadFileButton(
                    bottom: 48.6,
                    left: 90,
                    icon: const Icon(
                      Icons.photo_camera_outlined,
                    ),
                    onTap: () => _onPhotoTap(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadFileButton extends StatefulWidget {
  final double left;
  final double bottom;
  final Widget icon;
  final Function() onTap;

  const ThreadFileButton({
    super.key,
    required this.icon,
    required this.left,
    required this.bottom,
    required this.onTap,
  });

  @override
  State<ThreadFileButton> createState() => _ThreadFileButtonState();
}

class _ThreadFileButtonState extends State<ThreadFileButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      bottom: widget.bottom,
      child: DeferPointer(
        paintOnTop: true,
        child: Opacity(
          opacity: 0.4,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.onTap,
            child: widget.icon,
          ),
        ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
