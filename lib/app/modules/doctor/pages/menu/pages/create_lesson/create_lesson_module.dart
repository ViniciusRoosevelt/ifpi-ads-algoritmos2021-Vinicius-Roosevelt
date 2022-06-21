import 'package:flutter_modular/flutter_modular.dart';

import 'create_lesson_controller.dart';
import 'create_lesson_repository.dart';
import 'pages/create_lesson_page.dart';

class CreateLessonModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => CreateLessonRepository()),
    Bind((i) => CreateLessonController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => CreateLessonPage(),
    ),
  ];
}
