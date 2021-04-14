import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:flutter_webtoon/features/webcomic/web_comic_bloc.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:dart_extensions/dart_extensions.dart';

class WebComicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WebComicBloc>(
      create: (context) {
        return WebComicBloc()
          ..add(RequestWebComicEvent());
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
          onRetryClicked: (context) =>
          {
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
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: sections.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 134,
            color: Colors.white,
            child: Center(
                child: Row(
                  children: [
                    CachedNetworkImage(
                      width: 100,
                      height: 134,
                      imageUrl: "http://webtoon.tinyflutterteam.com/static/" +
                          sections[index].items[0].thumb.defaultEmpty(),
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter:
                                  ColorFilter.mode(
                                      Colors.white, BlendMode.colorBurn)),
                            ),
                          ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Expanded(
                      child: Text(
                        sections[index].items[0].name.defaultEmpty(),
                      ),
                    ),
                  ],
                )),
          ).paddingOnly(top: 5,left: 5,right: 5);
        });
  }
}
