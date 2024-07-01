import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/authentication/repos/authentication_repo.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';
import 'package:tread_clone_assignment/features/writing_thread/repos/thread_repo.dart';

class UploadThreadViewModel extends AsyncNotifier<void> {
  late final ThreadRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(threadRepoProvider);
  }

  Future<void> uploadThread(File? image, String? text) async {
    final uid = ref.read(authRepo).user!.uid;
    TaskSnapshot? textTask;
    TaskSnapshot? imageTask;
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(
      () async {
        if (image == null && text == null) {
          throw Exception('Both image and text cannot be null.');
        }

        if (image != null) {
          textTask = await _repo.uploadThreadText(text!, uid);
        }

        if (text != null) {
          imageTask = await _repo.uploadThreadImageFile(image!, uid);
        }
        if (textTask != null || imageTask != null) {
          await _repo.saveThread(
            ThreadModel(
              username: 'anon',
              userProfileUrl: 'assets/images/default_profile.webp',
              isVerified: true,
              thread: await textTask?.ref.getDownloadURL(),
              imageUrl: await imageTask?.ref.getDownloadURL(),
              replies: 0,
              likes: 0,
              createAt: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      },
    );
  }
}

final uploadThreadProvider = AsyncNotifierProvider<UploadThreadViewModel, void>(
  () => UploadThreadViewModel(),
);
