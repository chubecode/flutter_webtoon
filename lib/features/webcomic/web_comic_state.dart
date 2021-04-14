part of 'web_comic_bloc.dart';

@immutable
abstract class WebComicState {}

class WebComicInitial extends WebComicState {}

class WebComicLoading extends WebComicState {}

class WebComicError extends WebComicState {}

class WebComicSuccess extends WebComicState {
  final List<SectionEntity> sections;
  final List<SectionEntity> actionbarSections;
  final List<SectionEntity> rankingSections;
  final List<SectionEntity> sliderSections;

  WebComicSuccess({
    required this.sections,
    required this.actionbarSections,
    required this.rankingSections,
    required this.sliderSections,
  });
}
