import 'package:flutter_modular/flutter_modular.dart';

import 'pages/lessons/lessons_module.dart';
import 'pages/home/home_module.dart';

import 'pages/profile/profile_module.dart';
import 'patient_widget.dart';
import 'patient_controller.dart';
import 'patient_repository.dart';

class PatientModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => PatientRepository()),
    Bind((i) => PatientController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => PatientWidget(),
        children: [
          ModuleRoute('/home', module: HomeModule()),
          ModuleRoute('/lessons', module: LessonsModule()),
          ModuleRoute('/profile', module: ProfileModule()),
        ])
  ];
}
