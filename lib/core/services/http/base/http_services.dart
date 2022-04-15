abstract class HttpServices {
  Future<dynamic> post(String path, Map params);
  Future<dynamic> get(String path);
}
