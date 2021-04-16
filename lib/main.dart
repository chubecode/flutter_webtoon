import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/domain/repositories/webcomic_repository.dart';
import 'package:flutter_webtoon/domain/usecase/webcomic/get_webcomic_usecase.dart';
import 'package:flutter_webtoon/features/main/main.dart';
import 'package:get_it/get_it.dart';

import 'common/appTheme.dart';
import 'data/repository/webcomic/webcomic_repository_impl.dart';
import 'domain/usecase/check_user_state_usecase.dart';
import 'features/main/bloc/main_bloc.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';

//Run when change string json file
//flutter pub run easy_localization:generate --source-dir ./assets/translations
//flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
// => LocaleKeys.money_args

//Run when change retrofit config
//flutter pub run build_runner build --delete-conflicting-outputs
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  _initGetItDi();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      startLocale: Locale('en'),
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: StartApp(),
    ),
  );
}

void _initGetItDi() {
  GetIt.instance.registerFactory(() => CheckUserStateUseCase());
  GetIt.instance.registerLazySingleton<WebcomicRepository>(
      () => WebcomicRepositoryImpl());
  GetIt.instance.registerFactory(() => GetWebComicsUseCase());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainStateBloc>(
      create: (BuildContext context) => MainStateBloc()..add(InitEvent()),
      child: MaterialApp(
        title: LocaleKeys.app_title.tr(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
        ),
        initialRoute: MainScreen.screenName,
        routes: {
          MainScreen.screenName: (context) => MainScreen(),
        },
      ),
    );
  }
}
