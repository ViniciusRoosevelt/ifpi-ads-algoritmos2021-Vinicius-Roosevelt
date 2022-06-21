import 'package:apprax/app/modules/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_controller.dart';
import 'pages/auth_page.dart';
import 'pages/forgot_password/forgot_password_module.dart';
import 'pages/sign_up/sign_up_module.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository()),
        Bind((i) => AuthController(repository: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => AuthPage()),
        ModuleRoute('/sign-up', module: SignUpModule()),
        ModuleRoute('/forgot-password', module: ForgotPasswordModule()),
      ];
}
