import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: HomeModule()),
      ];
}