import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../core/models/patient.dart';

import 'mocks/patient_mock.dart';
import 'patient_controller.dart';

class PatientWidget extends StatefulWidget {
  const PatientWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PatientWidgetState();
}

class _PatientWidgetState extends State<PatientWidget> {
  Map<String, dynamic> userData = Modular.args.data;
  final controller = Modular.get<PatientController>();
  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/patient/home', arguments: userData);
    controller.getPermission();
    print(userData);
  }

  @override
  Widget build(BuildContext context) {
    controller.getPermission();
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
              Modular.to.navigate('/patient/home', arguments: userData);
            } else if (id == 1) {
              Modular.to.navigate('/patient/lessons', arguments: userData);
            } else if (id == 2) {
              Modular.to.navigate('/patient/profile', arguments: userData);
            }
          },
          currentIndex: controller.bottomNavIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_rounded), label: 'Lições'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Perfil'),
          ],
        ),
      );
  // _patientPhoto(Patient patient) => Container(
  //       height: 24.0,
  //       width: 24.0,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Image.network(patient.fotoPerfil ??
  //           'https://img.freepik.com/free-icon/important-person_318-10744.jpg?t=st=1645538552~exp=1645539152~hmac=268f4df1741112ca3b8735a233c8d50b8c76ebe5b0aa4d7bf90f1a359824ed8d&w=996'),
  //     );
}
