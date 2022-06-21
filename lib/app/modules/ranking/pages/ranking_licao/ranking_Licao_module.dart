import 'package:flutter_modular/flutter_modular.dart';

import '../../ranking_module.dart';
import '../../ranking_repository.dart';

import 'pages/ranking_Licao_Page.dart';
import 'ranking_licao_controller.dart';

class RankingLicaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RankingRepository()),
    Bind((i) => RankingLicaoController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => const RankingLicaoPage()),
  ];
}
