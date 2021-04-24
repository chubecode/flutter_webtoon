import 'package:flutter/material.dart';
import 'package:flutter_webtoon/features/home/home.dart';
import 'package:flutter_webtoon/features/webcomic/webcomic.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class WebtoonPageView extends StatefulWidget {
  @override
  _WebtoonPageViewState createState() => _WebtoonPageViewState();
}

class _WebtoonPageViewState extends State<WebtoonPageView> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.fiber_new),
        label: LocaleKeys.tab_news.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.broken_image_outlined),
        label: LocaleKeys.tab_comic.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pending),
        label: LocaleKeys.tab_novel.tr(),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: LocaleKeys.tab_books.tr(),
      ),
    ];
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

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 600), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }

}
