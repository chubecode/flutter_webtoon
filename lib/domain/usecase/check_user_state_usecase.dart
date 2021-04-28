import 'dart:math';

import 'package:flutter_webtoon/common/exception/failure.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/user_entity.dart';
import 'package:flutter_webtoon/domain/entity/user_state_entity.dart';

import 'base_usecase.dart';

class CheckUserStateUseCase extends BaseUseCase<EmptyInput, UserStateEntity> {
  @override
  Future<Either<Failure, UserStateEntity>> executeInternal(EmptyInput input) async {
    await Future.delayed(Duration(seconds: 3));
    List<String> arrLang = ['vi','en'];
    return SuccessValue(
      UserStateEntity(
        user: UserEntity(
          userId: "user01",
          userName: "You",
          langId: arrLang[Random.secure().nextInt(1)],
          token: "token1"
        ),
      ),
    );

    //Case 1: isConfigApi: false,
    // UserStateEntity(
    //   user: null,
    //   isConfigApi: false,
    // ),

    //Case 1: isConfigApi: true, not yet login
    // UserStateEntity(
    //   user: null,
    //   isConfigApi: true,
    // ),
  }
}
