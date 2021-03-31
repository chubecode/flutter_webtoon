import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/user_state_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';
import 'package:flutter_webtoon/domain/usecase/check_user_state_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'user_state_event.dart';

part 'user_state_state.dart';

class UserStateBloc extends Bloc<UserStateEvent, UserStateState> {
  CheckUserStateUseCase _getUserStateUseCase = GetIt.instance.get();

  UserStateBloc() : super(UserStateInitial());

  @override
  Stream<UserStateState> mapEventToState(
    UserStateEvent event,
  ) async* {
    if (event is InitEvent) {
      yield* handleEventInit();
    } else if (event is LoginEvent) {
      //TODO save login state
      yield UserStateLoginSuccess(
        token: event.token,
        langId: event.langId,
        name: event.name,
        id: event.id,
      );
    } else if (event is LogoutEvent) {
      yield UserStateNotYetLogin();
    }
  }

  Stream<UserStateState> handleEventInit() async* {
    Either<Error, UserStateEntity> state =
        await _getUserStateUseCase.execute(EmptyInput());
    if (state.isSuccess) {
      var userEntity = state.success.user;
      if (userEntity != null) {
        yield UserStateLoginSuccess(
          id: userEntity.userId,
          name: userEntity.userName,
          langId: userEntity.langId,
          token: userEntity.token,
        );
      } else {
        yield UserStateNotYetLogin();
      }
    } else {
      yield UserStateNotYetLogin();
    }
  }
}
