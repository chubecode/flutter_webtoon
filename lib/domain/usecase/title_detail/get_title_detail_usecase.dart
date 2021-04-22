import "package:flutter_webtoon/domain/either.dart";
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/domain/repositories/title_repository.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart';
import 'package:get_it/get_it.dart';

class GetTitleDetailUseCase
    extends BaseUseCase<GetTitleDetailUseCaseInput, TitleDetailEntity> {
  final TitleRepository _titleRepository = GetIt.instance.get();
  @override
  Future<Either<Error, TitleDetailEntity>> executeInternal(
      GetTitleDetailUseCaseInput input) async {
    return await _titleRepository.getTitleDetail(input.titleId);
  }
}

class GetTitleDetailUseCaseInput {
  final String titleId;

  GetTitleDetailUseCaseInput({required this.titleId});
}
