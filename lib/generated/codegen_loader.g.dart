// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_title": "Hello guys",
  "msg": "{} 111are written in the {} language",
  "msg_named": "Easy localization are written in the {lang} language",
  "msg_mixed": "{} are written in the {lang} language",
  "gender": {
    "male": "Hi man ;) {}",
    "female": "Hello girl :) {}",
    "other": "Hello {}"
  },
  "money_args": {
    "zero": "{} has no money",
    "one": "{} has {} dollar",
    "many": "{} has {} dollars",
    "other": "{} has {} dollars"
  },
  "login": "Login",
  "username": "Account",
  "password": "Password",
  "login_successful": "Login Successful",
  "login_failed": "Login Failed",
  "welcome_msg": "Welcome {} join closed society",
  "tab_news": "New feed",
  "tab_comic": "Comic",
  "tab_novel": "Novel",
  "tab_books": "Books",
  "search": "Search",
  "receive": "Receive",
  "change": "Change",
  "login_now": "Login now",
  "login_tooltip": "to follow good stories!",
  "list_comic": "List of comic",
  "list_novel": "List of novel",
  "my_club": "My club",
  "common_question": "common question",
  "rate_this_app": "Rate this app",
  "legacy": "Legacy",
  "feed_back": "Feedback"
};
static const Map<String,dynamic> vi = {
  "app_title": "Chào mấy cưng",
  "msg": "{} đã được viết bằng ngôn ngữ {}",
  "msg_named": "Easy localization đã được viết bằng ngôn ngữ {lang}",
  "msg_mixed": "{} đã được viết bằng ngôn ngữ {lang}",
  "gender": {
    "male": "Chào cưng ;) {}",
    "female": "Chào bé :) {}",
    "other": "Chào {}"
  },
  "money_args": {
    "zero": "{} hông có tiền",
    "one": "{} có {}USD",
    "many": "{} có nhiều lắm, {}USD",
    "other": "{} có nhiều lắm, {}USD"
  },
  "login": "Đăng nhập",
  "username": "Tên đăng nhập",
  "password": "Mật khẩu",
  "login_successful": "Đăng nhập thành công",
  "login_failed": "Đăng nhập thất bại",
  "welcome_msg": "Chào mừng {} gia nhập hội kín",
  "tab_news": "Bảng tin",
  "tab_comic": "Truyện tranh",
  "tab_novel": "Tiểu thuyết",
  "tab_books": "Giá sách",
  "search": "Tìm kiếm",
  "receive": "Nhận",
  "change": "Thay đổi",
  "login_now": "Đăng nhập ngay",
  "login_tooltip": "để theo dõi nhiều truyện hay!",
  "list_comic": "Danh mục truyện tranh",
  "list_novel": "Danh mục tiểu thuyết",
  "my_club": "Hội nhóm của tôi",
  "common_question": "Câu hỏi thường gặp",
  "rate_this_app": "Đánh giá ứng dụng",
  "legacy": "Chính sách điều khoản",
  "feed_back": "Góp ý"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "vi": vi};
}
