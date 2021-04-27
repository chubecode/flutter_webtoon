
import 'package:flutter_webtoon/common/exception/exception_interceptor.dart';
import 'package:flutter_webtoon/common/exception/failure.dart';

class WebComicExceptionInterceptor extends ExceptionInterceptor {
  @override
  Failure? handleException(Exception exception) {
    switch(exception){
      // case ServerError:
      //   break;
    //WAITING FOR CONVERTER support from retrofit flutter team.
    }
  }

}