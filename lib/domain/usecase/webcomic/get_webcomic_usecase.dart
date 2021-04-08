import "package:flutter_webtoon/domain/either.dart";
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';

class GetWebComicsUseCase extends BaseUseCase<EmptyInput,WebComicEntity>{
  @override
  Future<Either<Error, WebComicEntity>> executeInternal(EmptyInput input) async {
    // TODO: implement executeInternal
    throw UnimplementedError();
  }
  
}