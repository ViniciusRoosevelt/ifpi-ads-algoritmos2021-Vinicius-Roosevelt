import 'package:apprax/app/modules/doctor/doctor_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'doctor_widget.dart';
import 'doctor_controller.dart';
import 'pages/add_patient/add_patient_module.dart';
import 'pages/menu/menu_module.dart';
import 'pages/patient_list/patient_list_module.dart';

class DoctorModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => DoctorRepository()),
    Bind((i) => DoctorController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => DoctorWidget(),
      children: [
        ModuleRoute('/patient-list', module: PatientListModule()),
        ModuleRoute('/menu', module: MenuModule()),
        ModuleRoute('/add-patient', module: AddPatientModule()),
      ],
    )
  ];
}
