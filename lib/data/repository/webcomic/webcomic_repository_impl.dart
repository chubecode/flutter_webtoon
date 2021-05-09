
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/common/exception/failure.dart';
import 'package:flutter_webtoon/common/network.dart';
import 'package:flutter_webtoon/data/remote/api_service.dart';
import 'package:flutter_webtoon/data/remote/entities/webcomic/section_response.dart';
import 'package:flutter_webtoon/data/remote/entities/webcomic/title_response.dart';
import 'package:flutter_webtoon/data/remote/entities/webcomic/web_comic_response.dart';
import 'package:flutter_webtoon/domain/either.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:flutter_webtoon/domain/entity/section_item_entity.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:flutter_webtoon/domain/repositories/webcomic_repository.dart';


class WebcomicRepositoryImpl extends WebcomicRepository {
  @override
  Future<Either<Failure, WebComicEntity>> getWebcomics() async {
    // TODO: implement getWebcomics
    var requestGetBooks = apiServiceInstance.getWebComic();
    var getWebcomicsResult = await handleNetworkResult(requestGetBooks);
    if (getWebcomicsResult.isSuccess()) {
      var response = getWebcomicsResult.response;
      return SuccessValue(mapWebComicEntity(response?.data));
    } else {
      return FailValue(Failure.serverError(
          getWebcomicsResult.errorCode, getWebcomicsResult.error.toString()));
    }
  }

  WebComicEntity mapWebComicEntity(WebComicResponse? webComicResponse) {
    return WebComicEntity(
        sections: mapSections(webComicResponse?.sections),
        actionbarSections: mapSections(webComicResponse?.actionbarSections),
        rankingSections: mapSections(webComicResponse?.rankingSections),
        sliderSections: mapSections(webComicResponse?.sliderSections));
  }

  List<SectionEntity> mapSections(List<SectionResponse?>? sectionResponses) {
    if (sectionResponses != null) {
      return sectionResponses
          .map((e) => mapSectionEntity(e))
          .toList(growable: false);
    } else {
      return List.empty();
    }
  }

  SectionEntity mapSectionEntity(SectionResponse? sectionResponse) {
    return SectionEntity(
        name: sectionResponse?.name.defaultEmpty(),
        index: sectionResponse?.index.defaultZero(),
        title1: mapSectionItemEntity(sectionResponse?.title1),
        title2: mapSectionItemEntity(sectionResponse?.title2),
        items: mapSectionItemEntities(sectionResponse?.items),
        actionText: sectionResponse?.actionText.defaultEmpty(),
        navigationActionLink:
            sectionResponse?.navigationActionLink.defaultEmpty(),
        topImageThumbUrl: sectionResponse?.topImageThumbUrl.defaultEmpty());
  }

  List<SectionItemEntity> mapSectionItemEntities(
      List<TitleResponse?>? titleReponses) {
    if (titleReponses != null) {
      return titleReponses
          .map((e) => mapSectionItemEntity(e))
          .toList(growable: false);
    } else {
      return List.empty();
    }
  }

  SectionItemEntity mapSectionItemEntity(TitleResponse? titleResponse) {
    return SectionItemEntity(
        deeplink: titleResponse?.deeplink.defaultEmpty(),
        name: titleResponse?.name.defaultEmpty(),
        thumb: titleResponse?.thumb.defaultEmpty());
  }
}
