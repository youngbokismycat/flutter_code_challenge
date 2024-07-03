import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/main_home/view/widgets/cards/thread.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';
import 'package:tread_clone_assignment/features/writing_thread/repos/thread_repo.dart';

class ThreadTimelineViewModel extends AsyncNotifier<List<ThreadModel>> {
  late final ThreadRepository _repo;
  List<ThreadModel> _list = [];

  Future<List<ThreadModel>> _fetchThread() async {
    final result = await _repo.fetchThread();
    final threads = result.docs.map(
      (doc) => ThreadModel.fromMap(doc.data()),
    );
    return threads.toList();
  }

  @override
  FutureOr<List<ThreadModel>> build() async {
    _repo = ref.read(threadRepoProvider);
    final result = await _repo.fetchThread();
    final newList = result.docs.map(
      (doc) => ThreadModel.fromMap(
        doc.data(),
      ),
    );
    _list = newList.toList();
    return _list;
  }

  Future<void> refresh() async {
    final threads = await _fetchThread();
    _list = threads;
    state = AsyncValue.data(threads);
  }
}

final timelineProvider =
    AsyncNotifierProvider<ThreadTimelineViewModel, List<ThreadModel>>(
  () => ThreadTimelineViewModel(),
);
