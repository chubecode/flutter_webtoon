import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/features/home/home.dart';
import 'package:flutter_webtoon/features/main/bloc/main_bloc.dart';
import 'package:flutter_webtoon/features/main/custom_appbar.dart';
import 'package:flutter_webtoon/features/main/custom_bottom_bar.dart';
import 'package:flutter_webtoon/features/main/custom_drawer.dart';
import 'package:flutter_webtoon/features/webcomic/webcomic.dart';

class MainScreen extends StatelessWidget {
  static final screenName = "/";
  final PageController controller = PageController(initialPage: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {

        GlobalKey<ScaffoldState> _mainKey = GlobalKey();
        return BlocListener<MainStateBloc, MainState>(
          listener: (context, MainState state) {
            _listenBlocChange(state, context);
          },
          child: Scaffold(
            key: _mainKey,
            body: SafeArea(
              child: Stack(
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    onPageChanged: (value) {
                      BlocProvider.of<MainStateBloc>(context)
                          .add(ChangeTabEvent(value));
                    },
                    children: <Widget>[
                      HomeScreen(0),
                      WebComicScreen(),
                      HomeScreen(2),
                      HomeScreen(3),
                    ],
                  ),
                  MyCustomAppBar(
                    onDrawerTap: () => {_mainKey.currentState!.openDrawer()},
                    height: 60,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BlocBuilder<MainStateBloc, MainState>(
              builder: (BuildContext context, MainState state) {
                if (state is UserChangeTab) {
                  return _renderBottomBarChange(state, context);
                } else
                  return _renderBottomBarChange(UserChangeTab(0), context);
              },
            ),
            drawer: DrawerLayout(
                drawerWidth: MediaQuery.of(context).size.width * 0.9),
          ),
        );
      },
    );
  }

  void _listenBlocChange(MainState state, BuildContext context) {
    if (state is UserStateNotYetLogin) {
      Navigator.of(context)
          .popUntil(ModalRoute.withName(MainScreen.screenName));
    }
  }

  Widget _renderBottomBarChange(UserChangeTab state, BuildContext context) {
    // controller.animateToPage(
    //   state.index,
    //   duration: const Duration(milliseconds: 400),
    //   curve: Curves.easeInOut,
    // );
    return BottomBar(state: state, context: context);
  }
}
