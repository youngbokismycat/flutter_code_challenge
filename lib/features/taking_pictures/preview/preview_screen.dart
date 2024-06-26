import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:tread_clone_assignment/features/taking_pictures/preview/widgets/image_preview.dart';
import 'package:tread_clone_assignment/features/taking_pictures/preview/widgets/video_preview.dart';

class PreviewScreen extends StatelessWidget {
  final MediaCapture media;
  final String path;
  const PreviewScreen({
    super.key,
    required this.media,
    required this.path,
  });

  void _onReTakeTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onUseTap(BuildContext context) {
    Navigator.pop(context, media.captureRequest.path!);
    Navigator.pop(context, media.captureRequest.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: media.isPicture
            ? ImagePreview(
                filePath: path,
              )
            : VideoPreview(
                filePath: path,
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreviewButton(
              text: "Retake a photo",
              onTap: () => _onReTakeTap(context),
            ),
            PreviewButton(
              text: "Use the photo",
              onTap: () => _onUseTap(context),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const PreviewButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
