import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../core/styles/colors.dart';
import '../patient/pages/profile/pages/profile_page.dart';
import '../patient/pages/profile/profile_module.dart';
import 'doctor_controller.dart';
import 'pages/menu/menu_module.dart';
import 'pages/menu/pages/menu_page.dart';

class DoctorWidget extends StatefulWidget {
  DoctorWidget({Key? key}) : super(key: key);

  @override
  State<DoctorWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends State<DoctorWidget> {
  final controller = Modular.get<DoctorController>();
  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/doctor/patient-list', arguments: Modular.args.data);
    controller.bottomNavIndex.value = 0;
  }

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
                  Modular.to.navigate('/doctor/patient-list',
                      arguments: Modular.args.data);
                } else if (id == 1) {
                  Modular.to
                      .navigate('/doctor/menu', arguments: Modular.args.data);
                } else if (id == 2) {
                  Modular.to.navigate('/doctor/add-patient',
                      arguments: Modular.args.data);
                }
              },
              currentIndex: controller.bottomNavIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Pacientes'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
                BottomNavigationBarItem(
                    icon: Stack(
                      children: [
                        Icon(Icons.person_add_alt),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: controller.bottomNavIndex.value != 2
                                  ? AppColors.danger.withAlpha(240)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                    label: 'Solicitações'),
              ]));

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    // controller.bottomNavIndex.value = 0;
  }
}
