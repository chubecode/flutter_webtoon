import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/enums.dart';
import 'package:flutter_webtoon/features/main/bloc/main_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';

class BottomBar extends StatelessWidget {
  final MenuState selectedMenu;
  final BuildContext context;

  const BottomBar({
    Key? key,
    @required this.selectedMenu,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
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
      ],
      currentIndex: state.index,
      selectedItemColor: Colors.green,
      onTap: (int index) =>
      {BlocProvider.of<MainStateBloc>(context).add(ChangeTabEvent(index))},
    );
  }
}