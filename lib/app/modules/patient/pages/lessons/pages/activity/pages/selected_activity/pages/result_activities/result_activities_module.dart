import 'package:flutter_modular/flutter_modular.dart';

import 'pages/result_activities_page.dart';
import 'result_activities_repository.dart';
import 'result_activities_controller.dart';

class ResultActivitiesModule extends Module {
  @override
  List<Bind<Object>> binds = [
    Bind((i) => ResultActivitiesRepository()),
    Bind((i) => ResultActivitiesController(repository: i.get())),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => const ResultActivitiesPage())
  ];
}
