import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String filePath;

  const ImagePreview({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(filePath),
      width: MediaQuery.of(context).size.width,
    );
  }
}
