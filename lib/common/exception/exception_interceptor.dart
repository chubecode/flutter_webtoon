import 'package:flutter_webtoon/common/exception/failure.dart';

abstract class ExceptionInterceptor {
    Failure? handleException(Exception exception);
}