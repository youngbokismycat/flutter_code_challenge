import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tread_clone_assignment/core/consts/gaps.dart';
import 'package:tread_clone_assignment/core/consts/sizes.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/taking_pictures/preview/preview_screen.dart';
import 'package:tread_clone_assignment/features/writing_thread/widgets/thread_file_button.dart';
import 'package:tread_clone_assignment/main.dart';

class WriteThread extends ConsumerStatefulWidget {
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
  WriteThreadState createState() => WriteThreadState();
}

class WriteThreadState extends ConsumerState<WriteThread>
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
    _animationEffect();
  }

  void _animationEffect() {
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
      imageOrVideo = result.path;
      isRecieveResult = true;

      setState(() {});

      _animationEffect();
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
                      "jane_mobbinnnn",
                    ),
                    TextField(
                      autofocus: true,
                      onChanged: (value) => widget.onChanged(),
                      style: TextStyle(
                        color: isDarkMode(ref) ? Colors.white : Colors.black,
                        height: 1.2,
                      ),
                      cursorColor:
                          isDarkMode(ref) ? Colors.white : Colors.black,
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.only(bottom: 30),
                        hintText: "Start a thread...",
                        hintStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: isDarkMode(ref)
                                      ? Colors.white.withOpacity(
                                          0.4,
                                        )
                                      : Colors.black.withOpacity(
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
                    icon: FaIcon(
                      FontAwesomeIcons.images,
                      size: Sizes.size20,
                      color: isDarkMode(ref) ? Colors.white : Colors.black,
                    ),
                    onTap: () => _onImagesTap(),
                  ),
                  ThreadFileButton(
                    bottom: 48.6,
                    left: 90,
                    icon: Icon(
                      Icons.photo_camera_outlined,
                      color: isDarkMode(ref) ? Colors.white : Colors.black,
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
