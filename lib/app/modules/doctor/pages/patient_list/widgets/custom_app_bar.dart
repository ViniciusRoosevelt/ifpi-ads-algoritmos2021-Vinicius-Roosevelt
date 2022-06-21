import 'package:flutter/material.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../core/models/doctor.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key, required this.doctor}) : super(key: key);

  late Doctor doctor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primary,
        toolbarHeight: height * .25,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
        ),
        title: _appBarText(doctor.nome?.split(' ')[0] ?? '', height),
        actions: [_profileIcon(doctor.fotoPerfil ?? '')]);
  }

  _appBarText(String name, double height) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Olá, $name!',
              style: AppTypography.hx.copyWith(fontWeight: FontWeight.bold)),
          Text(
            'Acompanhe seus\npacientes!',
            style: AppTypography.h1,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.justify,
          ),
        ],
      );

  _profileIcon(String profilePicture) => Padding(
        padding: EdgeInsets.all(8),
        child: Stack(children: [
          Container(
              height: 60.0,
              width: 60.0,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(profilePicture),
                backgroundColor: Colors.white,
              ))
        ]),
      );
}
