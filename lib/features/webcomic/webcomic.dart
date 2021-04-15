import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:flutter_webtoon/domain/entity/title_entity.dart';
import 'package:flutter_webtoon/features/webcomic/web_comic_bloc.dart';
import 'package:flutter_webtoon/features/webcomic/webtoon_action.dart';
import 'package:flutter_webtoon/features/webcomic/webtoon_list.dart';
import 'package:flutter_webtoon/features/webcomic/webtoon_slider.dart';

class WebComicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WebComicBloc>(
      create: (context) {
        return WebComicBloc()..add(RequestWebComicEvent());
      },
      child: Scaffold(
        body: BlocBuilder<WebComicBloc, WebComicState>(
          builder: (BuildContext context, WebComicState state) {
            return _renderBlocStateChange(state);
          },
        ),
      ),
    );
  }

  Widget _renderBlocStateChange(WebComicState state) {
    if (state is WebComicSuccess) {
      return _renderSuccessState(state);
    } else if (state is WebComicError) {
      return Container(
        color: Colors.white,
        child: errorWidget(
          onRetryClicked: (context) => {
            BlocProvider.of<WebComicBloc>(context).add(RequestWebComicEvent())
          },
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: loadingWidget(),
      );
    }
  }

  Widget _renderSuccessState(WebComicSuccess state) {
    List<SectionEntity> sections = state.sections;
    List<TitleEntity> sliderSections = state.rankingSections.first.items;
    List<TitleEntity> actionSections = state.actionbarSections.first.items;
    return ListView(
      children: [
        WebtoonSlider(sliderSections: sliderSections),
        WebtoonAction(actionSections: actionSections),
        Expanded(
          child: WebtoonList(sections: sections),
        ),
      ],
    );
  }
}



