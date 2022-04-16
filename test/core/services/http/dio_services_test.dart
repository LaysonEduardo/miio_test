import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

void main() async {
  final _dio = Dio();
  final _dioAdapter = DioAdapter(dio: _dio);
  final _services = DioServices(dio: _dio);
  const path = 'https://example.com';

  setUp(() {
    _dio.httpClientAdapter = _dioAdapter;
  });

  group('GET Methods test', () {
    _dioAdapter.onGet(
      path,
      (request) => request.reply(200, {'message': 'Success!'}),
    );
    test('should return status code 200', () async {
      final Response response = await _services.get(path, {});
      debugPrint(response.statusCode.toString());
      expect(response.statusCode, 200);
    });
  });
}
