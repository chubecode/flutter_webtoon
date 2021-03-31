import 'package:flutter/cupertino.dart';
import 'package:flutter_webtoon/domain/either.dart';

abstract class BaseUseCase<I, O> {
  Future<Either<Error, O>> executeInternal(I input);

  Future<Either<Error, O>> execute(I input) async {
    try {
      return await executeInternal(input);
    } on Exception catch (e) {
      return FailValue(CommonError());
    }
  }
}


class EmptyInput {}

abstract class Error {}
class CommonError extends Error {}
abstract class FeatureError extends Error {}
@immutable
class NetworkError extends Error {
  final int errorCode;
  final String errorMsg;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  NetworkError({
    required this.errorCode,
    required this.errorMsg,
  }): super();

  NetworkError copyWith({
    int? errorCode,
    String? errorMsg,
  }) {
    if ((errorCode == null || identical(errorCode, this.errorCode)) &&
        (errorMsg == null || identical(errorMsg, this.errorMsg))) {
      return this;
    }

    return new NetworkError(
      errorCode: errorCode ?? this.errorCode,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  String toString() {
    return 'NetworkError{errorCode: $errorCode, errorMsg: $errorMsg}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkError &&
          runtimeType == other.runtimeType &&
          errorCode == other.errorCode &&
          errorMsg == other.errorMsg);

  @override
  int get hashCode => errorCode.hashCode ^ errorMsg.hashCode;

  factory NetworkError.fromMap(Map<String, dynamic> map) {
    return new NetworkError(
      errorCode: map['errorCode'] as int,
      errorMsg: map['errorMsg'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'errorCode': this.errorCode,
      'errorMsg': this.errorMsg,
    } as Map<String, dynamic>;
  }

//</editor-fold>
}

