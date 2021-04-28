import 'package:flutter/cupertino.dart';
import 'package:flutter_webtoon/common/exception/failure.dart';
import 'package:flutter_webtoon/domain/either.dart';

abstract class BaseUseCase<I, O> {
  Future<Either<Failure, O>> executeInternal(I input);

  Future<Either<Failure, O>> execute(I input) async {
    try {
      return await executeInternal(input);
    } on Exception catch (e) {
      return FailValue(Failure.uncatchError(e));
    }
  }
}


class EmptyInput {}


//</editor-fold>

