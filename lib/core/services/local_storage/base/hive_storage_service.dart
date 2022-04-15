import 'package:hive_flutter/hive_flutter.dart';
import 'local_storage_service.dart';

const _boxName = 'localStorage';

class HiveStorage implements LocalStorageService {
  final HiveInterface _hive = Hive;
  bool _hasStarted = false;

  @override
  Future<void> init() async {
    await _hive.initFlutter();
    await _hive.openBox(_boxName);
    _hasStarted = true;
  }

  Box get box {
    if (_hasStarted) {
      return _hive.box(_boxName);
    }

    throw Exception('LocalStorage not started');
  }

  @override
  Future<void> write(String key, value) async {
    await box.put(key, value);
  }

  @override
  Future read(String key) async {
    final value = await box.get(key);
    return value;
  }

  @override
  void delete(String key) async {
    await box.delete(key);
  }

  @override
  void deleteAll() async {
    await box.deleteFromDisk();
  }
}
