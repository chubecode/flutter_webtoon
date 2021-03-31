import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/features/main/main.dart';
import 'package:get_it/get_it.dart';

import 'common/appTheme.dart';
import 'domain/usecase/check_user_state_usecase.dart';
import 'features/main/bloc/user_state_bloc.dart';
import 'generated/codegen_loader.g.dart';
import 'generated/locale_keys.g.dart';

//Run when change string json file
//flutter pub run easy_localization:generate --source-dir ./assets/translations
//flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
// => LocaleKeys.money_args

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
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserStateBloc>(
      create: (BuildContext context) => UserStateBloc()..add(InitEvent()),
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

