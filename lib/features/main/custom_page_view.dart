import 'package:flutter/material.dart';
import 'package:flutter_webtoon/features/home/home.dart';
import 'package:flutter_webtoon/features/webcomic/webcomic.dart';

class WebtoonPageView extends StatefulWidget {
  @override
  _WebtoonPageViewState createState() => _WebtoonPageViewState();
}

class _WebtoonPageViewState extends State<WebtoonPageView> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return buildPageView();
  }
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(0),
        WebComicScreen(),
        HomeScreen(2),
        HomeScreen(3),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedPage = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
    });
  }
}
