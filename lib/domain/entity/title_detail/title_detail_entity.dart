import 'package:flutter/foundation.dart';

@immutable
class TitleDetailEntity {
  final String id;
  final String name;
  final String description;
  final String author;
  final DateTime releaseDate;
  final TitleType titleType;
  final String thumbVerticalUrl;
  final String thumbDetailUrl;
  final Status status;
  final ReadStatus readStatus;
  final int avgReviewScore;
  final int numReview;
  final int numLike;
  final int numRead;
  final int numComment;
  final int numChapter;
  final List<ChapterEntity> chapters;

  const TitleDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
    required this.releaseDate,
    required this.titleType,
    required this.thumbVerticalUrl,
    required this.thumbDetailUrl,
    required this.status,
    required this.readStatus,
    required this.avgReviewScore,
    required this.numReview,
    required this.numLike,
    required this.numRead,
    required this.numComment,
    required this.numChapter,
    required this.chapters,
  });
}

@immutable
class ChapterEntity {
  final String id;
  final String name;
  final DateTime releaseDate;
  final int numLike;
  final int numRead;
  final int numComment;

  const ChapterEntity({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.numLike,
    required this.numRead,
    required this.numComment,
  });
}

enum ReadStatus {
  OnGoing, // 'OG'
  Suppended, // 'SP'
  Stoped, // ST
  Full, //FU
}

enum Status {
  Open, // 'O'
  Close, // 'C'
  CommingSoon, // CS
}

enum TitleType {
  WebComic, // 'WC'
  WebNovel, // 'WN'
}
