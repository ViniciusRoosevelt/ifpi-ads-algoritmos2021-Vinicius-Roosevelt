import 'package:flutter_modular/flutter_modular.dart';

import 'pages/about_us_page.dart';
import 'pages/app_config/app_config_module.dart';
import 'pages/create_lesson/create_lesson_module.dart';
import 'pages/edit_profile/edit_profile_module.dart';
import 'pages/menu_page.dart';
import 'menu_controller.dart';
import 'menu_repository.dart';

class MenuModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => MenuRepository()),
    Bind((i) => MenuController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => MenuPage(),
    ),
    ModuleRoute(
      '/edit-profile',
      module: EditProfileModule(),
    ),
    ModuleRoute(
      '/create-lesson',
      module: CreateLessonModule(),
    ),
    ModuleRoute(
      '/app-config',
      module: AppConfigModule(),
    ),
    ChildRoute(
      '/about-us',
      child: (_, __) => AboutUsPage(),
    ),
  ];
}
