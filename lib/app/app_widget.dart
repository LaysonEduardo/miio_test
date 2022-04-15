import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/core/services/http/base/http_services.dart';
import 'package:miio_test/core/services/http/dio_services.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final HttpServices http = Modular.get<DioServices>();
  @override
  void initState() {
    http.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Miio - Test',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
