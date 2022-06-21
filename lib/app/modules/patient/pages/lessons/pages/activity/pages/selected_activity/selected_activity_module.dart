import 'package:apprax/app/modules/patient/pages/lessons/pages/activity/pages/selected_activity/pages/result_activities/result_activities_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/selected_activity_page.dart';
import 'selected_activity_controller.dart';
import 'selected_activity_repository.dart';

class SelectedActivityModule extends Module {
  @override
  List<Bind<Object>> binds = [
    Bind((i) => SelectedActivityRepository()),
    Bind((i) => SelectedActivityController(i.get()))
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SelectedActivityPage()),
    ModuleRoute('/result-activities', module: ResultActivitiesModule())
  ];
}
