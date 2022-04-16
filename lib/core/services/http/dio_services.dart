// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import 'base/http_services.dart';

class DioServices implements HttpServices {
  Dio dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  DioServices({required this.dio});

  @override
  void init() {
    dio.options.baseUrl = _baseUrl;
  }

  @override
  Future get(String path, Map<String, dynamic> params) async {
    try {
      Response response = await dio.get(path, queryParameters: params);
      return response;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
