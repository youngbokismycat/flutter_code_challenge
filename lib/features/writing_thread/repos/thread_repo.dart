import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tread_clone_assignment/features/writing_thread/model/thread_model.dart';

class ThreadRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // upload thread
  UploadTask uploadThreadText(String thread, String uid) {
    final fileRef = _storage
        .ref()
        .child('/threads/$uid/${DateTime.now().millisecondsSinceEpoch}');
    return fileRef.putString(thread);
  }

  // upload image
  UploadTask uploadThreadImageFile(File image, String uid) {
    final fileRef = _storage.ref().child(
          '/images/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}',
        );
    return fileRef.putFile(image);
  }

  // upload document
  Future<void> saveThread(
    ThreadModel data,
  ) async {
    await _db.collection('thread').add(data.toMap());
  }
}

final threadRepoProvider = Provider(
  (ref) => ThreadRepository(),
);
