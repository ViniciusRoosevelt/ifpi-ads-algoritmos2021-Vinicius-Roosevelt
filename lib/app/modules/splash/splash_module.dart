import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_controller.dart';
import '../auth/auth_repository.dart';
import 'pages/splash_page.dart';
import 'splash_controller.dart';

class SplashModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => AuthRepository()),
    Bind((i) => AuthController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashPage())
  ];
}
