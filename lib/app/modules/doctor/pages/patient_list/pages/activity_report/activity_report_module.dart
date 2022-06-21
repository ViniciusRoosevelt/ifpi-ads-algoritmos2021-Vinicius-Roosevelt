import 'package:flutter_modular/flutter_modular.dart';

import 'pages/activity_report_page.dart';
import 'activity_report_controller.dart';

class ActivityReportModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => ActivityReportController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ActivityReportPage()),
  ];
}
