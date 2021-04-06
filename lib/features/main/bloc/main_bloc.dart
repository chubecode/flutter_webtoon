import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/user_state_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';
import 'package:flutter_webtoon/domain/usecase/check_user_state_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainStateBloc extends Bloc<MainStateEvent, MainState> {
  CheckUserStateUseCase _getUserStateUseCase = GetIt.instance.get();

  MainStateBloc() : super(UserStateInitial());

  @override
  Stream<MainState> mapEventToState(
    MainStateEvent event,
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
    } else if (event is ChangeTabEvent) {
      yield UserChangeTab(event.index);
    }
  }

  Stream<MainState> handleEventInit() async* {
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
