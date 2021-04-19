import 'package:json_annotation/json_annotation.dart';

import 'chapters.dart';

part 'title_detail_response.g.dart';

@JsonSerializable()
class TitleDetailResponse {
	@JsonKey(name: 'id')
	final String? id;
	@JsonKey(name: 'name')
	final String? name;
	@JsonKey(name: 'description')
	final String? description;
	@JsonKey(name: 'author')
	final String? author;
	@JsonKey(name: 'releaseDate')
	final String? releaseDate;
	@JsonKey(name: 'titleType')
	final String? titleType;
	@JsonKey(name: 'thumbVerticalUrl')
	final String? thumbVerticalUrl;
	@JsonKey(name: 'thumbDetailUrl')
	final String? thumbDetailUrl;
	@JsonKey(name: 'status')
	final String? status;
	@JsonKey(name: 'readStatus')
	final String? readStatus;
	@JsonKey(name: 'avgReviewScore')
	final int? avgReviewScore;
	@JsonKey(name: 'numReview')
	final int? numReview;
	@JsonKey(name: 'numLike')
	final int? numLike;
	@JsonKey(name: 'numRead')
	final int? numRead;
	@JsonKey(name: 'numComment')
	final int? numComment;
	@JsonKey(name: 'numChapter')
	final int? numChapter;
	@JsonKey(name: 'chapters')
	final List<Chapters>? chapters;

	const TitleDetailResponse({
		this.id,
		this.name,
		this.description,
		this.author,
		this.releaseDate,
		this.titleType,
		this.thumbVerticalUrl,
		this.thumbDetailUrl,
		this.status,
		this.readStatus,
		this.avgReviewScore,
		this.numReview,
		this.numLike,
		this.numRead,
		this.numComment,
		this.numChapter,
		this.chapters,
	});

	factory TitleDetailResponse.fromJson(Map<String, dynamic> json) {
		return _$TitleDetailResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TitleDetailResponseToJson(this);
}
