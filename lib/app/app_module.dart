import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'modules/auth/auth_module.dart';
import 'modules/doctor/doctor_module.dart';
import 'modules/patient/patient_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/ranking/ranking_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/patient', module: PatientModule()),
        ModuleRoute('/doctor', module: DoctorModule()),
        ModuleRoute('/ranking', module: RankingModule())
      ];
}
