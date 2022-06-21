import 'package:flutter_modular/flutter_modular.dart';

import 'pages/app_config_page.dart';
import 'app_config_controller.dart';

class AppConfigModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => AppConfigController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => AppConfigPage()),
  ];
}
