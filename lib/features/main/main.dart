import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/features/home/home.dart';
import 'package:flutter_webtoon/features/main/bloc/main_bloc.dart';
import 'package:flutter_webtoon/features/main/custom_appbar.dart';
import 'package:flutter_webtoon/features/main/custom_bottom_bar.dart';
import 'package:flutter_webtoon/features/main/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  static final screenName = "/";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var drawerWidth = MediaQuery.of(context).size.width * 0.9;
        GlobalKey<ScaffoldState> _mainKey = GlobalKey();
        return BlocListener<MainStateBloc, MainState>(
          listener: (context, MainState state) {
            _listenBlocChange(state, context);
          },
          child: SafeArea(
            child: Scaffold(
              key: _mainKey,
              body: Column(
                children: [
                  MyCustomAppBar(
                    onDrawerTap: ()=>{
                      _mainKey.currentState!.openDrawer()
                    },
                    height: 60,
                  ),
                  BlocBuilder<MainStateBloc, MainState>(
                    builder: (BuildContext context, MainState state) {
                      return _renderBlocChange(state, context);
                    },
                  ),
                ],
              ),
              bottomNavigationBar: BlocBuilder<MainStateBloc, MainState>(
                builder: (BuildContext context, MainState state) {
                  if (state is UserChangeTab) {
                    return _renderBottomBarChange(state, context);
                  } else
                    return _renderBottomBarChange(UserChangeTab(0), context);
                },
              ),
              drawer: DrawerLayout(drawerWidth: drawerWidth),
            ),
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

  StatelessWidget _renderBlocChange(MainState state, BuildContext context) {
    if (state is UserStateInitial) {
      return Container(color: Colors.white, child: loadingWidget());
    } else if (state is UserStateLoginSuccess) {
      return HomeScreen();
    } else if (state is UserChangeTab) {
      return Container(
        color: Colors.white,
        child: Text('Tab ${state.index}').toCenter(),
      );
    } else {
      return HomeScreen();
    }
  }

  Widget _renderBottomBarChange(UserChangeTab state, BuildContext context) {
    return BottomBar(state: state, context: context);
  }
}

