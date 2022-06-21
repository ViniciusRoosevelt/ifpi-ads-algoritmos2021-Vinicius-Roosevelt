import 'package:flutter_modular/flutter_modular.dart';

import 'pages/profile_page.dart';

import 'profile_controller.dart';
import 'profile_repository.dart';

class ProfileModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind(((i) => ProfileRepository())),
    Bind((i) => ProfileController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ProfilePage()),
  ];
}
