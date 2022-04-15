import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

class PostServices {
  final DioServices dio = Modular.get<DioServices>();

  fetch() async {
    final value = await dio.get('/post', {"limit": 10});
    print(value);
  }
}
