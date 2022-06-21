import 'package:flutter_modular/flutter_modular.dart';

import 'pages/ranking_geral/ranking_geral_module.dart';
import 'pages/ranking_licao/ranking_licao_module.dart';
import './ranking_controller.dart';
import './ranking_repository.dart';
import 'ranking_widget.dart';

class RankingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RankingRepository()),
    Bind((i) => RankingController(repository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute(
    //   Modular.initialRoute,
    //   child: (_, __) => const RankingWidget(),
    // ),
    ModuleRoute('/ranking-geral', module: RankingGeralModule()),
    ModuleRoute('/ranking-licao', module: RankingLicaoModule()),
  ];
}
