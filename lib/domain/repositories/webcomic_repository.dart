import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';

abstract class WebcomicRepository {
  Future<Either<Error, WebComicEntity>> getWebcomics();
}
