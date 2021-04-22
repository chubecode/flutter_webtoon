part of 'titledetail_bloc.dart';

@immutable
abstract class TitledetailState {}

// @immutable
// class Chapter {
//   final String chapterName;
//   final int numRead;
//   final int numLike;
//   final int numComment;
//   final DateTime publishDate;

//   Chapter({
//     required this.chapterName,
//     required this.numRead,
//     required this.numLike,
//     required this.numComment,
//     required this.publishDate,
//   });
// }

// @immutable
// class TitleDetail {
//   final String titleName;
//   final String description;
//   final String thumbUrl;
//   final int numRead;
//   final int numChapter;
//   final int numLike;
//   final int numComment;
//   final int numReview;
//   final double avgReview;

//   TitleDetail({
//     required this.titleName,
//     required this.description,
//     required this.thumbUrl,
//     required this.numRead,
//     required this.numChapter,
//     required this.numLike,
//     required this.numComment,
//     required this.numReview,
//     required this.avgReview,
//   });
// }

class LoadingState extends TitledetailState {}

class SuccessState extends TitledetailState {
  final TitleDetailEntity titleDetail;

  SuccessState({required this.titleDetail});
}

class ErrorState extends TitledetailState {}
