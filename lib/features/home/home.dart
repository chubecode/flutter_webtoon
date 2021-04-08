import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/features/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<HomeBloc>(
      create: (context) {
        return HomeBloc()..add(InitHomeEvent());
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return _renderBlocStateChange(context, size, state);
          },
        ),
      ),
    );
  }

  Widget _renderBlocStateChange(
      BuildContext context, Size size, HomeState state) {
    if (state is HomeInitial) {
      return Container(
        child: Text('HomeInitial').toCenter(),
      );
    } else {
      return Container();
    }
  }
}
