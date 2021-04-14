import 'package:flutter_webtoon/common/network.dart';
import 'package:flutter_webtoon/data/remote/api_service.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/repositories/webcomic_repository.dart';
import 'package:flutter_webtoon/domain/usecase/base_usecase.dart' as baseUC;

class WebcomicRepositoryImpl extends WebcomicRepository {
  @override
  Future<Either<baseUC.Error, WebComicEntity>> getWebcomics() async {
    // TODO: implement getWebcomics
    var requestGetBooks = apiServiceInstance.getWebComic();
    var getWebcomicsResult = await handleNetworkResult(requestGetBooks);
    if (getWebcomicsResult.isSuccess()) {
      var response = getWebcomicsResult.response;
      if (response != null) {
        return SuccessValue(response);
      } else {
        return FailValue(
            baseUC.NetworkError(errorCode: 404, errorMsg: "error"));
      }
    } else {
      return FailValue(baseUC.NetworkError(errorCode: 404, errorMsg: "error"));
    }
  }
}
