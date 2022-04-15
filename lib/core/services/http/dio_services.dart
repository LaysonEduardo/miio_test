// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import 'base/http_services.dart';

class DioServices implements HttpServices {
  Dio dio;
  final String _baseUrl = 'https://dummyapi.io/data/v1';

  DioServices({required this.dio});

  @override
  void init() {
    dio.options.baseUrl = _baseUrl;
    dio.options.headers = {"app-id": "6259211cf1aef00d0cb22862"};
  }

  @override
  Future get(String path, Map params) async {
    try {
      Response response = await dio.get(path);
      return response;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future post(String path, Map params) async {
    try {
      final response = await dio.post(
        path,
        data: jsonEncode(params),
      );
      return response;
    } on DioError {
      print('error');
    }
  }
}
