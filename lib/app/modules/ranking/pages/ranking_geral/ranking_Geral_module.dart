import 'package:flutter_modular/flutter_modular.dart';

import '../../ranking_repository.dart';
import 'pages/ranking_Geral_Page.dart';
import 'ranking_geral_controller.dart';

class RankingGeralModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RankingRepository()),
    Bind((i) => RankingGeralController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => const RankingGeralPage()),
  ];
}
