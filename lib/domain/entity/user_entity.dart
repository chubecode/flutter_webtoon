import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  final String userId;
  final String userName;
  final String langId;
  final String token;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const UserEntity({
    required this.userId,
    required this.userName,
    required this.langId,
    required this.token,
  });

  UserEntity copyWith({
    String? userId,
    String? userName,
    String? langId,
    String? token,
  }) {
    if ((userId == null || identical(userId, this.userId)) &&
        (userName == null || identical(userName, this.userName)) &&
        (langId == null || identical(langId, this.langId)) &&
        (token == null || identical(token, this.token))) {
      return this;
    }

    return new UserEntity(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      langId: langId ?? this.langId,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserEntity{userId: $userId, userName: $userName, langId: $langId, token: $token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userName == other.userName &&
          langId == other.langId &&
          token == other.token);

  @override
  int get hashCode =>
      userId.hashCode ^ userName.hashCode ^ langId.hashCode ^ token.hashCode;

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return new UserEntity(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      langId: map['langId'] as String,
      token: map['token'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'userName': this.userName,
      'langId': this.langId,
      'token': this.token,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}