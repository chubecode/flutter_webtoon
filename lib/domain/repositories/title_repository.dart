import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';

abstract class TitleRepository {
  Future<Either<Error, TitleDetailEntity>> getTitleDetail();
}
