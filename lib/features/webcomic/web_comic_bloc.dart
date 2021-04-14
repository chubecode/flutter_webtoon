import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';
import 'package:flutter_webtoon/domain/usecase/webcomic/get_webcomic_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'web_comic_event.dart';

part 'web_comic_state.dart';

class WebComicBloc extends Bloc<WebComicEvent, WebComicState> {

  GetWebComicsUseCase _getWebComicsUseCase = GetIt.instance.get();

  WebComicBloc() : super(WebComicInitial());

  @override
  Stream<WebComicState> mapEventToState(WebComicEvent event,) async* {
    if (event is RequestWebComicEvent) {
      yield* _handleRequestEvent();
    }
  }

  Stream<WebComicState> _handleRequestEvent() async* {
    yield WebComicLoading();
    Either<Error, WebComicEntity> result =
    await _getWebComicsUseCase.execute(EmptyInput());
    if (result.isSuccess) {
      yield WebComicSuccess(
          sliderSections: result.success.sliderSections,
          actionbarSections: result.success.actionbarSections,
          rankingSections: result.success.rankingSections,
          sections: result.success.sections
      );
    } else {
      yield WebComicError();
    }
  }
}
