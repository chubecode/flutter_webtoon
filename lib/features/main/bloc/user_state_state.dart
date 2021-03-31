part of 'user_state_bloc.dart';

@immutable
abstract class UserStateState {}

class UserStateInitial extends UserStateState {}

class UserStateNotYetLogin extends UserStateState {}

@immutable
class UserStateLoginSuccess extends UserStateState {
  final String id;
  final String token;
  final String name;
  final String langId;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  UserStateLoginSuccess({
    required this.id,
    required this.token,
    required this.name,
    required this.langId,
  }) : super();

  UserStateLoginSuccess copyWith({
    String? id,
    String? token,
    String? name,
    String? langId,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (token == null || identical(token, this.token)) &&
        (name == null || identical(name, this.name)) &&
        (langId == null || identical(langId, this.langId))) {
      return this;
    }

    return new UserStateLoginSuccess(
      id: id ?? this.id,
      token: token ?? this.token,
      name: name ?? this.name,
      langId: langId ?? this.langId,
    );
  }

  @override
  String toString() {
    return 'UserStateLoginSuccess{id: $id, token: $token, name: $name, langId: $langId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStateLoginSuccess &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          token == other.token &&
          name == other.name &&
          langId == other.langId);

  @override
  int get hashCode =>
      id.hashCode ^ token.hashCode ^ name.hashCode ^ langId.hashCode;

  factory UserStateLoginSuccess.fromMap(Map<String, dynamic> map) {
    return new UserStateLoginSuccess(
      id: map['id'] as String,
      token: map['token'] as String,
      name: map['name'] as String,
      langId: map['langId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'token': this.token,
      'name': this.name,
      'langId': this.langId,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
