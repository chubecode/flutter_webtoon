import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'titledetail_event.dart';
part 'titledetail_state.dart';

class TitledetailBloc extends Bloc<TitledetailEvent, TitledetailState> {
  TitledetailBloc() : super(TitledetailInitial());

  @override
  Stream<TitledetailState> mapEventToState(
    TitledetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
