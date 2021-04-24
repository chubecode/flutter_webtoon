import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/features/home/home.dart';
import 'package:flutter_webtoon/features/main/bloc/main_bloc.dart';
import 'package:flutter_webtoon/features/main/custom_appbar.dart';
import 'package:flutter_webtoon/features/main/custom_bottom_bar.dart';
import 'package:flutter_webtoon/features/main/custom_drawer.dart';
import 'package:flutter_webtoon/features/webcomic/webcomic.dart';

class TitleDetailScreen extends StatelessWidget {
  static final screenName = "/titledetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text("TitleDetailScreen"))),
    );
  }
}
