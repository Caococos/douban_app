
import 'package:dio/dio.dart';
import 'package:douban_app/network/http_config.dart';

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIMEOUT
  );
  static final dio = Dio(baseOptions);

  static Future request(String url, {String method = "get", Map<String, dynamic> ?params}) async {

  //  发送网络请求
    Options options = Options(method: method);
    try {
      final res = await dio.request(url,queryParameters: params, options: options);
      return res;
    } on DioError catch (err){
      throw err;
    }

  }
}