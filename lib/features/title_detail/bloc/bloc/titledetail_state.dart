part of 'titledetail_bloc.dart';

@immutable
abstract class TitledetailState {}

class LoadingState extends TitledetailState {}

class SuccessState extends TitledetailState {
  final TitleDetailEntity titleDetail;

  SuccessState({required this.titleDetail});
}

class ErrorState extends TitledetailState {}
