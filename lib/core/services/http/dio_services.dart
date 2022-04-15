// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import 'base/http_services.dart';

class DioServices implements HttpServices {
  Dio dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  DioServices({required this.dio});

  void init() {
    dio.options.baseUrl = _baseUrl;
  }

  @override
  Future get(String path) async {
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
