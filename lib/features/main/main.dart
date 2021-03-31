import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webtoon/common/common_widgets.dart';
import 'package:flutter_webtoon/common/components/background.dart';
import 'package:flutter_webtoon/common/components/language_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/features/main/bloc/user_state_bloc.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';

import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatelessWidget {
  static final screenName = "/";

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocListener<UserStateBloc, UserStateState>(
          listener: (context, UserStateState state) {
            _listenBlocChange(state, context);
          },
          child: Scaffold(
            body: BlocBuilder<UserStateBloc, UserStateState>(
              builder: (BuildContext context, UserStateState state) {
                return _renderBlocChange(state,context);
              },
            ),
          ),
        );
      },
    );
  }

  void _listenBlocChange(UserStateState state, BuildContext context) {
    if (state is UserStateNotYetLogin) {
      Navigator.of(context)
          .popUntil(ModalRoute.withName(MainScreen.screenName));
    }
  }

  StatelessWidget _renderBlocChange(UserStateState state, BuildContext context) {
    if (state is UserStateInitial) {
      return Container(color: Colors.white, child: loadingWidget());
    } else if (state is UserStateLoginSuccess) {
      return Background(
        child: Column(
          children: <Widget> [
            Text(LocaleKeys.login_successful).tr().toCenter(),
            Text(LocaleKeys.welcome_msg).tr(args: [state.name]).toCenter(),
            LanguageField(),
          ],
        ).paddingOnly(top: 300),
      );
    } else {
      return Container(
        color: Colors.white,
        child:  Text(LocaleKeys.login_failed).tr().toCenter()
      );
    }
  }
}
