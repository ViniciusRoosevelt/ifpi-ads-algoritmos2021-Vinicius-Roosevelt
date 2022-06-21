import 'package:apprax/app/modules/ranking/pages/ranking_licao/pages/ranking_Licao_Page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'pages/ranking_geral/pages/ranking_Geral_Page.dart';
import 'pages/ranking_geral/ranking_geral_module.dart';
import 'pages/ranking_licao/ranking_Licao_module.dart';
import 'ranking_controller.dart';

class RankingWidget extends StatefulWidget {
  const RankingWidget({Key? key}) : super(key: key);

  @override
  State<RankingWidget> createState() => _RankingWidgetState();
}

class _RankingWidgetState extends State<RankingWidget> {
  final controller = Modular.get<RankingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNav(),
      body: RouterOutlet(),
    );
  }

  Widget _bottomNav() => RxBuilder(
      builder: (_) => BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              onTap: (id) {
                controller.bottomNavIndex.value = id;
                if (id == 0) {
                  Modular.to.navigate('/ranking/ranking-geral');
                } else if (id == 1) {
                  Modular.to.navigate('/ranking/ranking-licao');
                }
              },
              currentIndex: controller.bottomNavIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Geral'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Licão'),
              ]));
}
