import 'package:flutter_modular/flutter_modular.dart';

import 'pages/activity/user_activity_module.dart';
import 'pages/lessons_page.dart';

import 'lessons_controller.dart';
import 'lessons_repository.dart';

class LessonsModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => LessonsRepository()),
    Bind((i) => LessonsController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => LessonsPage()),
    ModuleRoute('/activities', module: UserActivityModule()),
  ];
}
