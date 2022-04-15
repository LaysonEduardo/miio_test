import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/configuration/services/post/posts_services.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/post/post_module.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeBloc()),
        Bind.factory((i) => PostServices()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => HomePage())),
        ModuleRoute('/post', module: PostModule()),
      ];
}
