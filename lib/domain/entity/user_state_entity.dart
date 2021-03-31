import 'package:flutter/foundation.dart';
import 'package:flutter_webtoon/domain/entity/user_entity.dart';

@immutable
class UserStateEntity {
  final UserEntity? user;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const UserStateEntity({
    required this.user,
  });

  UserStateEntity copyWith({
    bool? isConfigApi,
    UserEntity? user,
  }) {
    if ((isConfigApi == null) &&
        (user == null || identical(user, this.user))) {
      return this;
    }

    return new UserStateEntity(
      user: user ?? this.user,
    );
  }

  @override
  String toString() {
    return 'UserStateEntity{user: $user}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStateEntity &&
          runtimeType == other.runtimeType &&
          user == other.user);

  @override
  int get hashCode => user.hashCode;

  factory UserStateEntity.fromMap(Map<String, dynamic> map) {
    return new UserStateEntity(
      user: map['user'] as UserEntity?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'user': this.user,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}