import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/core/router/router_name.dart';
import 'package:tread_clone_assignment/features/authentication/repos/authentication_repo.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';
import 'package:tread_clone_assignment/features/writing_thread/repos/thread_repo.dart';

class UploadThreadViewModel extends AsyncNotifier<void> {
  late final ThreadRepository _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(threadRepoProvider);
  }

  Future<void> uploadThread(
    File? image,
    String? text,
    BuildContext context,
  ) async {
    final uid = ref.read(authRepo).user!.uid;
    TaskSnapshot? textTask;
    TaskSnapshot? imageTask;
    state = const AsyncValue.loading();
    if (state.isLoading) {
      showLoadingSnackBar(context);
    }
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
    if (state.hasError) {
      showErrorSnackBar(context, state.error);
    }
  }
}

final uploadThreadProvider = AsyncNotifierProvider<UploadThreadViewModel, void>(
  () => UploadThreadViewModel(),
);
