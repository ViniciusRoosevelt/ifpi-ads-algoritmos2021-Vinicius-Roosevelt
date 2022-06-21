import 'package:flutter_modular/flutter_modular.dart';

import 'pages/activity_report/activity_report_module.dart';
import 'pages/patient_audio_list/patient_audio_module.dart';
import 'pages/patient_details_page.dart';
import 'pages/patient_list_page.dart';
import 'patient_list_controller.dart';
import 'patient_list_repository.dart';

class PatientListModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => PatientListRepository()),
    Bind((i) => PatientListController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => PatientListPage(),
    ),
    ChildRoute(
      '/patient-details',
      child: (context, args) => PatientDetailsPage(),
    ),
    ModuleRoute('/activity-report', module: ActivityReportModule()),
    ModuleRoute('/audio-list', module: PatientAudioModule()),
  ];
}
