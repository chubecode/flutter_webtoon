import 'package:json_annotation/json_annotation.dart';

part 'chapters.g.dart';

@JsonSerializable()
class Chapters {
	@JsonKey(name: 'id')
	final String? id;
	@JsonKey(name: 'name')
	final String? name;
	@JsonKey(name: 'releaseDate')
	final String? releaseDate;
	@JsonKey(name: 'numLike')
	final int? numLike;
	@JsonKey(name: 'numRead')
	final int? numRead;
	@JsonKey(name: 'numComment')
	final int? numComment;

	const Chapters({
		this.id,
		this.name,
		this.releaseDate,
		this.numLike,
		this.numRead,
		this.numComment,
	});

	factory Chapters.fromJson(Map<String, dynamic> json) {
		return _$ChaptersFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ChaptersToJson(this);
}
