import 'package:flutter_modular/flutter_modular.dart';

import 'patient_audio_controller.dart';
import 'patient_audio_repository.dart';
import 'pages/patient_audio_page.dart';

class PatientAudioModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => PatientAudioRepository()),
    Bind((i) => PatientAudioController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => PatientAudioPage(),
    ),
  ];
}
