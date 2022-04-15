import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/home/home_module.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioServices(dio: Dio())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}
