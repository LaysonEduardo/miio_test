abstract class HttpServices {
  init();
  Future<dynamic> get(String path, Map<String, dynamic> params);
}
