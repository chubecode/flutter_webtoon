import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/domain/usecase/title_detail/get_title_detail_usecase.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart' as baseUC;
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'titledetail_event.dart';
part 'titledetail_state.dart';

class TitledetailBloc extends Bloc<TitledetailEvent, TitledetailState> {
  TitledetailBloc() : super(LoadingState());

  GetTitleDetailUseCase _getTitleDetailUseCase = GetIt.instance.get();

  @override
  Stream<TitledetailState> mapEventToState(
    TitledetailEvent event,
  ) async* {
    if (event is RequestTitleEvent) {
      yield* _handleRequestEvent(event.titleId);
    }
  }

  Stream<TitledetailState> _handleRequestEvent(String titleId) async* {
    yield LoadingState();
    Either<baseUC.Error, TitleDetailEntity> result =
        await _getTitleDetailUseCase
            .execute(GetTitleDetailUseCaseInput(titleId: titleId));
    if (result.isSuccess) {
      yield SuccessState(titleDetail: result.success);
    } else {
      yield ErrorState();
    }
  }
}
