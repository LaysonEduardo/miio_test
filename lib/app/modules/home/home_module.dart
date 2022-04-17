import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/configuration/services/posts_services.dart';
import 'package:miio_test/app/modules/home/bloc/home_bloc.dart';
import 'package:miio_test/app/modules/post/bloc/post_bloc.dart';
import 'package:miio_test/app/modules/post/page/post_page.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeBloc(i())),
        Bind.factory((i) => PostBloc()),
        Bind.factory((i) => PostServices()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => HomePage())),
        ChildRoute('/post/:id', child: ((context, args) => PostPage(id: int.parse(args.params['id'])))),
      ];
}
