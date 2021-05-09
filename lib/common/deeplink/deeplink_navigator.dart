import 'package:flutter/cupertino.dart';
import 'package:flutter_webtoon/features/title_detail/title_detail.dart';

class DeeplinkNavigator {
  void gotoDeeplink(BuildContext context, String deeplink) {
    if (deeplink.trim().isNotEmpty) {
      print("gotoDeeplink $deeplink");
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
      if (deeplink.startsWith("deeplink://webcomic")) {
        var uri = Uri.parse(deeplink);
        String? titleId = uri.queryParameters["id"];
        if(titleId != null) {
          Navigator.of(context).pushNamed(
            TitleDetailScreen.screenName,
            arguments: TitleDetailScreenArguments(
              titleId: titleId,
            ),
          );
        }
      }
    }
  }
}
