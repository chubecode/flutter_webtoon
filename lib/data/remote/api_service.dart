import 'package:dio/dio.dart';
import 'package:flutter_webtoon/common/network.dart';
import 'package:flutter_webtoon/domain/entity/web_comic_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

final apiServiceInstance = ApiService(createDioInstance());

@RestApi(baseUrl: "http://103.221.220.249/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/webtoon_api/home/webcomic")
  Future<WebComicEntity> getWebComic();
}