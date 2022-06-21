import 'package:flutter_modular/flutter_modular.dart';

import 'edit_profile_repository.dart';
import 'pages/edit_profile_page.dart';
import 'edit_profile_controller.dart';

class EditProfileModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => EditProfileRepository()),
    Bind((i) => EditProfileController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => EditProfilePage()),
  ];
}
