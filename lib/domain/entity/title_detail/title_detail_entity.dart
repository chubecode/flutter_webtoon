import 'package:flutter/foundation.dart';

@immutable
class TitleDetailEntity {
  final String id;
  final String name;
  final String description;
  final String author;
  final String releaseDate;
  final String titleType;
  final String thumbVerticalUrl;
  final String thumbDetailUrl;
  final String status;
  final String readStatus;
  final int avgReviewScore;
  final int numReview;
  final int numLike;
  final int numRead;
  final int numComment;
  final int numChapter;
  final List<Chapters> chapters;

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
class Chapters {
	final String id;
	final String name;
	final String releaseDate;
	final int numLike;
	final int numRead;
	final int numComment;

	const Chapters({
		required this.id,
		required this.name,
		required this.releaseDate,
		required this.numLike,
		required this.numRead,
		required this.numComment,
	});

}
