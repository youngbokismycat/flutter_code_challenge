import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/common/model/thread_model.dart';
import 'package:tread_clone_assignment/features/common/repo/thread_repo.dart';

class SearchViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;

  Future<List<ThreadModel>> searchThread(String value) async {
    final result = await _repo.searchThread(value);
    final searchList = result.docs.map((doc) {
      return ThreadModel.fromMap(doc.data());
    }).where((thread) {
      return thread.thread != null &&
          thread.thread!.toLowerCase().contains(value.toLowerCase());
    }).toList();
    return searchList;
  }

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repo = ref.read(threadRepoProvider);
    return [];
  }
}

final searchProvider =
    AsyncNotifierProvider<SearchViewModel, List<ThreadModel>>(
  () => SearchViewModel(),
);
