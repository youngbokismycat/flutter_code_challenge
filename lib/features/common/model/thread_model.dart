import 'dart:convert';

import 'package:flutter/widgets.dart';

class ThreadModel {
  final String username;
  final String userProfileUrl;
  final bool isVerified;
  final String? thread;
  final String? imageUrl;
  final int replies;
  final int likes;
  final int createAt;

  ThreadModel({
    required this.username,
    required this.userProfileUrl,
    required this.isVerified,
    required this.thread,
    required this.imageUrl,
    required this.replies,
    required this.likes,
    required this.createAt,
  });

  ThreadModel copyWith({
    String? username,
    String? userProfileUrl,
    bool? isVerified,
    ValueGetter<String?>? thread,
    ValueGetter<String?>? imageUrl,
    int? replies,
    int? likes,
    int? createAt,
  }) {
    return ThreadModel(
      username: username ?? this.username,
      userProfileUrl: userProfileUrl ?? this.userProfileUrl,
      isVerified: isVerified ?? this.isVerified,
      thread: thread != null ? thread() : this.thread,
      imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
      replies: replies ?? this.replies,
      likes: likes ?? this.likes,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'userProfileUrl': userProfileUrl,
      'isVerified': isVerified,
      'thread': thread,
      'imageUrl': imageUrl,
      'replies': replies,
      'likes': likes,
      'createAt': createAt,
    };
  }

  factory ThreadModel.fromMap(Map<String, dynamic> map) {
    return ThreadModel(
      username: map['username'] ?? '',
      userProfileUrl: map['userProfileUrl'] ?? '',
      isVerified: map['isVerified'] ?? false,
      thread: map['thread'],
      imageUrl: map['imageUrl'],
      replies: map['replies']?.toInt() ?? 0,
      likes: map['likes']?.toInt() ?? 0,
      createAt: map['createAt']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThreadModel.fromJson(String source) =>
      ThreadModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ThreadModel(username: $username, userProfileUrl: $userProfileUrl, isVerified: $isVerified, thread: $thread, imageUrl: $imageUrl, replies: $replies, likes: $likes, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThreadModel &&
        other.username == username &&
        other.userProfileUrl == userProfileUrl &&
        other.isVerified == isVerified &&
        other.thread == thread &&
        other.imageUrl == imageUrl &&
        other.replies == replies &&
        other.likes == likes &&
        other.createAt == createAt;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        userProfileUrl.hashCode ^
        isVerified.hashCode ^
        thread.hashCode ^
        imageUrl.hashCode ^
        replies.hashCode ^
        likes.hashCode ^
        createAt.hashCode;
  }
}
