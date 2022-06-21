import 'package:flutter_modular/flutter_modular.dart';

import 'add_patient_controller.dart';
import 'add_patient_repository.dart';
import 'pages/add_patient_page.dart';

class AddPatientModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => AddPatientRepository()),
    Bind((i) => AddPatientController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => AddPatientPage(),
    ),
  ];
}
