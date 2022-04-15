abstract class LocalStorageService {
  Future<void> init();
  dynamic read(String key);
  void write(String key, value);
  void delete(String key);
  void deleteAll();
}
