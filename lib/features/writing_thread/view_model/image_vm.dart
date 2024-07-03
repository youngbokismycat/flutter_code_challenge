import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/image_model.dart';

class ImageViewModel extends StateNotifier<ImageModel> {
  ImageViewModel() : super(ImageModel());

  void setUrl(String? url) {
    state = ImageModel(url: url);
  }
}

final imageProvider = StateNotifierProvider<ImageViewModel, ImageModel>(
  (ref) => ImageViewModel(),
);
