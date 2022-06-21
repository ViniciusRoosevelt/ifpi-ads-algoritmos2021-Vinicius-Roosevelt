import 'package:flutter_modular/flutter_modular.dart';

import 'forgot_password_controller.dart';
import 'pages/forgot_password_page.dart';

class ForgotPasswordModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => ForgotPasswordController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const ForgotPasswordPage()),
      ];
}
