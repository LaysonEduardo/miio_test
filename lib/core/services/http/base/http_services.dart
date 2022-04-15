abstract class HttpServices {
  init();
  Future<dynamic> post(String path, Map params);
  Future<dynamic> get(String path, Map<String, dynamic> params);
}
