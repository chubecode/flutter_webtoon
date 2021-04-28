import 'package:flutter_webtoon/common/exception/failure.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';

abstract class WebcomicRepository {
  Future<Either<Failure, WebComicEntity>> getWebcomics();
}
