import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/core/consts/utils.dart';
import 'package:tread_clone_assignment/features/authentication/repos/authentication_repo.dart';

class SigninViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> signin(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => _repository.signin(email, password),
    );
    if (state.hasError) {
      showErrorSnackBar(context, state.error);
    }
  }
}

final loginProvider = AsyncNotifierProvider<SigninViewModel, void>(
  () => SigninViewModel(),
);
