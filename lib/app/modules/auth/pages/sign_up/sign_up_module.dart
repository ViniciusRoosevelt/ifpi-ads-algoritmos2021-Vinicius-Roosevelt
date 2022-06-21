import 'package:flutter_modular/flutter_modular.dart';

import 'sign_up_controller.dart';
import 'pages/sign_up_page.dart';
import 'sign_up_repository.dart';

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpRepository()),
        Bind((i) => SignUpController(repository: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const SignUpPage()),
      ];
}
