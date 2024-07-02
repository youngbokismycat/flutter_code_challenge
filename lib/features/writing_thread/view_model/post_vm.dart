import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/post_model.dart';

class PostViewModel extends StateNotifier<PostModel> {
  PostViewModel() : super(PostModel(isPostEnabled: false));

  bool get isPostEnabled => state.isPostEnabled;

  void setPostEnabled(bool value) {
    state = PostModel(isPostEnabled: value);
  }
}

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, PostModel>((ref) {
  return PostViewModel();
});
