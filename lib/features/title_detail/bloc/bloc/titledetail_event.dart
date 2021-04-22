part of 'titledetail_bloc.dart';

@immutable
abstract class TitledetailEvent {}

@immutable
class RequestTitleEvent extends TitledetailEvent {
  final String titleId;

  RequestTitleEvent({required this.titleId});
}
