import 'package:flutter_webtoon/common/network.dart';
import 'package:flutter_webtoon/data/remote/api_service.dart';
import 'package:flutter_webtoon/data/repository/title_detail/title_detail_mapper.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/domain/repositories/title_repository.dart';
import 'package:flutter_webtoon/common/exception/failure.dart';

class TitleRepositoryImpl extends TitleRepository {
  final TitleDetailMapper _titleDetailMapper;

  TitleRepositoryImpl(this._titleDetailMapper);

  @override
  Future<Either<Failure, TitleDetailEntity>> getTitleDetail(String id) async {
    var requestTitleDetail = apiServiceInstance.getTitleDetail(id);
    var getTitleDetailResult = await handleNetworkResult(requestTitleDetail);
    if (getTitleDetailResult.isSuccess()) {
      return SuccessValue(_titleDetailMapper.map(getTitleDetailResult.response));
    } else {
      return FailValue(Failure.serverError(
        getTitleDetailResult.errorCode,
        getTitleDetailResult.error.toString(),
      ));
    }
  }
}
