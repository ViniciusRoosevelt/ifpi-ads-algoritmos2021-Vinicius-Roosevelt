import 'dart:async';

import 'package:apprax/app/modules/auth/pages/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/services/local_data/local_data.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';
import '../../../doctor_controller.dart';
import '../../../mocks/doctor_mock.dart';
import '../menu_controller.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<MenuPage, MenuController> {
  var doctorController = Modular.get<DoctorController>();

  @override
  void initState() {
    super.initState();
    if (Modular.args.data.runtimeType == String) {
      doctorController.doctorUserIdBackup = Modular.args.data as String;
    }
    controller.doctorUserId = doctorController.doctorUserIdBackup;
    controller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return RxBuilder(builder: (context) {
      if (controller.requestState.value == RequestState.LOADING) {
        return SimpleLoaderWidget(key: Key('pageLoader'));
      } else {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Row(
                  children: [
                    Container(
                        height: 100.0,
                        width: 100.0,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              controller.doctor.fotoPerfil ??
                                  'https://via.placeholder.com/150'),
                          backgroundColor: Colors.white,
                        )),
                    Spacer(),
                    Container(
                      width: width * .6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _nameField(controller.doctor.nome),
                          _profileField(controller.doctor.email),
                          _profileField(
                              'Crefono: ${controller.doctor.regiaoConselho ?? ''}-${controller.doctor.numeroConselho ?? ''}'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .075,
                ),
                _menuTile(controller.doctor, width, 'Editar seu perfil',
                    '/doctor/menu/edit-profile', Icons.person_outline),
                SizedBox(
                  height: height * .03,
                ),
                // _menuTile(controller.doctor, width, 'Configurações do app',
                //     '/doctor/menu/app-config', Icons.edit_outlined),
                // SizedBox(
                //   height: height * .03,
                // ),
                _menuTile(controller.doctor, width, 'Sobre nós',
                    '/doctor/menu/about-us', Icons.info_outline),
                SizedBox(
                  height: height * .03,
                ),
                controller.doctor.isAdmin!
                    ? _menuTile(controller.doctor, width, 'Criar nova lição',
                        '/doctor/menu/create-lesson', Icons.create_rounded)
                    : Container(),

                Spacer(),
                _logoutButton(),
                SizedBox(
                  height: height * .03,
                )
              ],
            ),
          ),
        );
      }
    });
  }

  _nameField(String? name) => Text(
        name ?? '',
        style: AppTypography.h1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
      );

  _profileField(String? field) => Text(
        field ?? '',
        style: AppTypography.body,
        textAlign: TextAlign.center,
      );

  _menuTile(Doctor? doctor, double width, String text, String url,
          IconData icon) =>
      InkWell(
        onTap: () {
          Modular.to.pushNamed(url, arguments: doctor?.id ?? '');
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

  _logoutButton() => AppGhostButton(
        onPressed: () async {
          await LocalData.deleteAccessData();
          FirebaseAuth.instance.signOut();
          doctorController.bottomNavIndex.value = 0;
          Modular.to.navigate('/auth');
        },
        text: 'Sair do App',
        leftIcon: Icons.logout_outlined,
        color: AppColors.danger,
      );
}
