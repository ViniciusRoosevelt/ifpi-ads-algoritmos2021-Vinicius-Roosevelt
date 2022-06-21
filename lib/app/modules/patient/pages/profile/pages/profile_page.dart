import 'package:apprax/app/modules/patient/patient_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/models/patient.dart';
import '../../../../../core/services/local_data/local_data.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../core/widgets/buttons/app_ghost_button.dart';

import '../../../mocks/patient_mock.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var patientController = Modular.get<PatientController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var data = Modular.args.data;

    Patient patient = Patient.fromJson(data);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          addAutomaticKeepAlives: false,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileInfo(patient),
            _options(width, height),
          ],
        ),
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 0,
        title: Text(
          'Perfil',
          style: AppTypography.h2.copyWith(color: AppColors.black_56),
        ),
      );

  _options(double width, double height) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _menuTile(width, 'Editar seu perfil', '', Icons.person_outline),
            SizedBox(
              height: height * .03,
            ),
            _menuTile(width, 'Configurações do app', '', Icons.edit_outlined),
            SizedBox(
              height: height * .03,
            ),
            _menuTile(width, 'Sobre nós', '', Icons.info_outline),
            SizedBox(
              height: height * .03,
            ),
            SizedBox(
              height: height * .03,
            ),
            _logoutButton(),
            SizedBox(
              height: height * .2,
            )
          ],
        ),
      );

  _profileInfo(Patient patient) => Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _patientPhoto(patient),
            SizedBox(width: 20),
            //_patientInfo(patient),
          ],
        ),
      );

  _patientPhoto(Patient patient) => Container(
        height: 100.0,
        width: 100.0,
        child: Image.network(patient.fotoPerfil!),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
      );

  _patientInfo(Patient patient) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.nome!,
              overflow: TextOverflow.visible,
              style: AppTypography.h1,
              textAlign: TextAlign.left,
            ),
            Text(
              'Email: ${patient.email!}',
              style: AppTypography.body,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );

  _menuTile(double width, String text, String url, IconData icon) => InkWell(
        onTap: () {
          Modular.to.pushNamed(url);
        },
        child: Container(
          padding: EdgeInsets.all(width * .015),
          decoration: _optionCardStyle(),
          child: ListTile(
            leading: Icon(
              icon,
              color: AppColors.primary,
            ),
            title: Text(
              text,
              style: AppTypography.h2,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
            ),
          ),
        ),
      );

  _optionCardStyle() => BoxDecoration(
          color: AppColors.card_background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black_16,
              blurRadius: 4.0,
            ),
          ]);

  _editProfileButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AppFlatButton(
          onPressed: () {},
          text: 'Editar seu Perfil',
          leftIcon: Icons.perm_identity_rounded,
          isExpanded: true,
        ),
      );

  _appConfigButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AppFlatButton(
          text: 'Configurações do App',
          leftIcon: Icons.drive_file_rename_outline_outlined,
          onPressed: () {},
          isExpanded: true,
        ),
      );

  _appInfoButton() => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: AppFlatButton(
          text: 'Sobre Nós',
          leftIcon: Icons.info_outline_rounded,
          onPressed: () {},
          isExpanded: true,
        ),
      );

  _logoutButton() => AppGhostButton(
        onPressed: () async {
          await LocalData.deleteAccessData();
          FirebaseAuth.instance.signOut();
          patientController.bottomNavIndex.value = 0;
          Modular.to.navigate('/auth');
        },
        text: 'Sair do App',
        leftIcon: Icons.logout_outlined,
        color: AppColors.danger,
      );
}

  // Padding(
  //       padding: const EdgeInsets.only(top: 50),
  //       child: ElevatedButton(
  //         onPressed: () {},
  //         style: _logOutButtonStyle(width, height),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Icon(
  //                 Icons.logout_outlined,
  //                 color: AppColors.dangerLight,
  //               ),
  //             ),
  //             Text(
  //               'Sair do App',
  //               style:
  //                   AppTypography.button.copyWith(color: AppColors.dangerLight),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  // _logOutButtonStyle(double width, double height) => ElevatedButton.styleFrom(
  //       primary: Colors.white,
  //       side: BorderSide(color: AppColors.dangerLight),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(height),
  //       ),
  //       fixedSize: Size(width * .65, height * .08),
  //     );
  //_logOutButton();
