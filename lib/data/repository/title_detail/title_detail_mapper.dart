import 'package:flutter_webtoon/data/remote/entities/title/chapters.dart';
import 'package:flutter_webtoon/data/remote/entities/title/title_detail_response.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';

class TitleDetailMapper {
  TitleDetailEntity map(TitleDetailResponse? response) {
    return TitleDetailEntity(
      author: (response?.author).defaultEmpty(),
      avgReviewScore: (response?.avgReviewScore).defaultZero(),
      chapters: mapChapters(response?.chapters),
      description: (response?.description).defaultEmpty(),
      id: (response?.id).defaultEmpty(),
      name: (response?.name).defaultEmpty(),
      numChapter: (response?.numChapter).defaultZero(),
      numComment: (response?.numComment).defaultZero(),
      numLike: (response?.numLike).defaultZero(),
      numRead: (response?.numRead).defaultZero(),
      numReview: (response?.numReview).defaultZero(),
      readStatus: mapReadStatus((response?.readStatus).defaultEmpty()),
      releaseDate: (response?.releaseDate).defaultEmpty().parseDateApi(),
      status: mapStatus((response?.status).defaultEmpty()),
      thumbDetailUrl: (response?.thumbDetailUrl).defaultEmpty(),
      thumbVerticalUrl: (response?.thumbVerticalUrl).defaultEmpty(),
      titleType: mapTitleType((response?.titleType).defaultEmpty()),
    );
  }

  TitleType mapTitleType(String titleType) {
    if (titleType == "WC") {
      return TitleType.WebComic;
    }

    if (titleType == "WN") {
      return TitleType.WebNovel;
    }

    return TitleType.WebComic;
  }

  Status mapStatus(String status) {
    if (status == "O") {
      return Status.Open;
    }

    if (status == "C") {
      return Status.Close;
    }

    if (status == "CS") {
      return Status.CommingSoon;
    }
    return Status.Open;
  }

  ReadStatus mapReadStatus(String readStatus) {
    if (readStatus == "OG") {
      return ReadStatus.OnGoing;
    }
    if (readStatus == "SP") {
      return ReadStatus.Suppended;
    }
    if (readStatus == "ST") {
      return ReadStatus.Stoped;
    }
    if (readStatus == "FU") {
      return ReadStatus.Full;
    }
    return ReadStatus.OnGoing;
  }

  List<ChapterEntity> mapChapters(List<Chapters>? chapters) {
    if (chapters != null) {
      return chapters.map((e) => mapChapterEntity(e)).toList(growable: false);
    } else {
      return List.empty();
    }
  }

  ChapterEntity mapChapterEntity(Chapters chapter) {
    return ChapterEntity(
      id: chapter.id.defaultEmpty(),
      name: chapter.name.defaultEmpty(),
      numComment: chapter.numComment.defaultZero(),
      numLike: chapter.numLike.defaultZero(),
      numRead: chapter.numRead.defaultZero(),
      releaseDate: chapter.releaseDate.defaultEmpty().parseDateApi(),
    );
  }
}
