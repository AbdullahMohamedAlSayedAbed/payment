import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required String url,
      required body,
      required String token,
      Map<String, dynamic>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers:headers?? {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
        ));
    return response;
  }
}
