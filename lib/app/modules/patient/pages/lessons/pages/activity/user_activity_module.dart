import 'package:apprax/app/modules/patient/pages/lessons/pages/activity/pages/selected_activity/selected_activity_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/activitites_list_page.dart';
import 'pages/selected_activity/pages/selected_activity_page.dart';
import 'user_activity_controller.dart';
import 'user_activity_repository.dart';

class UserActivityModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => UserActivityRepository()),
    Bind((i) => UserActivityController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ActivitiesListPage()),
    ModuleRoute('/selected-activity', module: SelectedActivityModule()),
  ];
}
