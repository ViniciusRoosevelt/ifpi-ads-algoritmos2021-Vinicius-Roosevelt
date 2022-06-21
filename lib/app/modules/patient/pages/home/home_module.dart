import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

import 'home_controller.dart';
import 'home_repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => HomeRepository()),
    Bind((i) => HomeController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomePage()),
  ];
}
