import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/domain/entity/title_detail/title_detail_entity.dart';
import 'package:flutter_webtoon/features/title_detail/bloc/bloc/titledetail_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';

class TitleDetailScreenArguments {
  final String titleId;

  TitleDetailScreenArguments({required this.titleId});
}

class TitleDetailScreen extends StatelessWidget {
  static final screenName = "/titledetail";

  @override
  Widget build(BuildContext context) {
    final TitleDetailScreenArguments? args = ModalRoute.of(context)?.settings.arguments.asOrNull<TitleDetailScreenArguments>();
    final String? titleId = args?.titleId;

    if(titleId == null) {
      return Scaffold(body: _renderBlocStateChange(context, ErrorState(), titleId.defaultEmpty()));
    } else {
      return BlocProvider<TitledetailBloc>(
        create: (context) {
          return TitledetailBloc()
            ..add(RequestTitleEvent(titleId: titleId));
        },
        child: Scaffold(
          body: BlocBuilder<TitledetailBloc, TitledetailState>(
            builder: (BuildContext context, TitledetailState state) {
              return _renderBlocStateChange(context, state, titleId);
            },
          ),
        ),
      );
    }
  }

  Container _buildHeaderImage(BuildContext context, TitleDetailEntity titleDetail) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.network(
            titleDetail.thumbDetailUrl,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [Text("Left")],
                  ),
                  Row(
                    children: [Text("Right")],
                  )
                ],
              ).paddingAll(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderBlocStateChange(BuildContext context, TitledetailState state, String titleId) {
    if(state is LoadingState) {
      return Container(
        color: Colors.white,
        child: loadingWidget(),
      );
    } else if(state is SuccessState) {
      List<Widget> chapters = _buildChapters(state.titleDetail);
      return ListView(
        children: [
          _buildHeaderImage(context, state.titleDetail),
        ]..addAll(chapters),
      );
    } else {
      return Container(
        color: Colors.white,
        child: errorWidget(onRetryClicked: (context) => {
          BlocProvider.of<TitledetailBloc>(context).add(RequestTitleEvent(titleId: titleId))
        },),
      );
    }
  }

  List<Widget> _buildChapters(TitleDetailEntity titleDetail) {
    return titleDetail.chapters.mapList((chapter) => _buildChapter(chapter));
  }

  Widget _buildChapter(ChapterEntity chapter) {
    return ListTile(
      leading: Icon(Icons.add),
      title: Text(chapter.name, textScaleFactor: 1.5,),
      trailing: Icon(Icons.done),
      subtitle: Text('${chapter.numRead.format()} read, ${chapter.numLike.format()} like, ${chapter.numComment.format()} comment'),
      selected: true,
      onTap: () {
        //TODO go to Chapter detail
      },
    );
  }
}

// class TitleDetailPagerWidget extends StatefulWidget {
//   const TitleDetailPagerWidget({Key? key}) : super(key: key);
//   @override
//   _TitleDetailPagerWidgetState createState() => _TitleDetailPagerWidgetState();
// }

// class _TitleDetailPagerWidgetState extends State<TitleDetailPagerWidget>
//     with SingleTickerProviderStateMixin {
//   final List<Tab> myTabs = <Tab>[
//     Tab(text: 'LEFT'),
//     Tab(text: 'RIGHT'),
//   ];

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: myTabs.length);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: null,
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: myTabs,
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: myTabs.map((Tab tab) {
//           final String label = tab.text!.toLowerCase();
//           return Center(
//             child: Text(
//               'This is the $label tab',
//               style: const TextStyle(fontSize: 36),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

class TitleDetailScreenScroll extends StatelessWidget {
  static final screenName = "/titledetail";

  TitleDetailScreenScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              // Provide a standard title.
              title: Text(title),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Placeholder(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 200,
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
