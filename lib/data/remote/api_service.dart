import 'package:dio/dio.dart';
import 'package:flutter_webtoon/common/network.dart';
import 'package:flutter_webtoon/data/remote/entities/webcomic/web_comic_result.dart';
import 'package:flutter_webtoon/data/remote/wrapped_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

final apiServiceInstance = ApiService(createDioInstance());

@RestApi(baseUrl: "http://webtoon.tinyflutterteam.com/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/webtoon_api/home/webcomic")
  Future<WebComicResult> getWebComic();
}
