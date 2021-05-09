import 'package:flutter_webtoon/common/exception/failure.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';

abstract class TitleRepository {
  Future<Either<Failure, TitleDetailEntity>> getTitleDetail(String id);
}