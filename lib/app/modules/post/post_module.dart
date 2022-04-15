import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/modules/post/page/post_page.dart';

class PostModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => PostPage(id: args.params['id']))),
      ];
}
