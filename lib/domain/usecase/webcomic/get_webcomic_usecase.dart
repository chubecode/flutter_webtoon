import "package:flutter_webtoon/domain/either.dart";
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/repositories/webcomic_repository.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';
import 'package:get_it/get_it.dart';

class GetWebComicsUseCase extends BaseUseCase<EmptyInput, WebComicEntity> {
  WebcomicRepository _webcomicRepository = GetIt.instance.get();
  @override
  Future<Either<Error, WebComicEntity>> executeInternal(
      EmptyInput input) async {
    return await _webcomicRepository.getWebcomics();
  }
}
