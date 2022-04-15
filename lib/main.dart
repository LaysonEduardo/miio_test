import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_test/app/app_module.dart';
import 'package:miio_test/app/app_widget.dart';
import 'package:miio_test/core/services/UI/ui_services.dart';

void main() async {
  await UiServices.init();
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
