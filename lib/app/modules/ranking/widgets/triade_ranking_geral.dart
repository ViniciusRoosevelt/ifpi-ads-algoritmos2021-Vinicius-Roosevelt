// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:apprax/app/core/styles/typography.dart';
import 'package:flutter/material.dart';

import '../../ranking/mocks/ranking_mock.dart';
import 'package:ionicons/ionicons.dart';
import '../../../core/styles/colors.dart';

class TriadeRankingGeral extends StatelessWidget {
  const TriadeRankingGeral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var patient = rankingMock.pacientes;
    patient
        .sort((p1, p0) => p0.notalGeral.value.compareTo(p1.notalGeral.value));

    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .4,
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 3 - 110,
          top: 40,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                '2º',
                style: AppTypography.h2,
              ),
              const SizedBox(
                height: 50,
              ),
              patient.length >= 2
                  ? CustomCircleAvatar(
                      usuario: _splitfirtsname(patient[1].nome!),
                      size: 100,
                      image: patient[1].fotoPerfil!,
                      imgposition: 'assets/medalha-terceiro-lugar.png',
                      pontuacao: patient[1].notalGeral.value,
                    )
                  : const CustomCircleAvatar(
                      usuario: '',
                      size: 100,
                      image:
                          'https://png.pngtree.com/element_origin_min_pic/00/00/06/12575cb97a22f0f.jpg',
                      imgposition: 'assets/medalha-terceiro-lugar.png',
                      pontuacao: 0.0,
                    ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 3 + 130,
          top: 40,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                "3º",
                style: AppTypography.h2,
              ),
              const SizedBox(
                height: 50,
              ),
              patient.length >= 3
                  ? CustomCircleAvatar(
                      usuario: _splitfirtsname(patient[2].nome!),
                      size: 100,
                      image: patient[2].fotoPerfil!,
                      imgposition: 'assets/medalha-segundo-lugar.png',
                      pontuacao: patient[2].notalGeral.value,
                    )
                  : const CustomCircleAvatar(
                      usuario: '',
                      size: 100,
                      image:
                          'https://png.pngtree.com/element_origin_min_pic/00/00/06/12575cb97a22f0f.jpg',
                      imgposition: 'assets/medalha-segundo-lugar.png',
                      pontuacao: 0.0,
                    ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Text(
                "1º",
                style: AppTypography.h2,
              ),
              const SizedBox(
                height: 10,
              ),
              patient.isNotEmpty
                  ? CustomCircleAvatar(
                      usuario: _splitfirtsname(patient[0].nome!),
                      size: 120,
                      image: patient[0].fotoPerfil!,
                      imgposition: 'assets/medalha-primeiro-lugar.png',
                      pontuacao: patient[0].notalGeral.value,
                    )
                  : const CustomCircleAvatar(
                      usuario: '',
                      size: 100,
                      image:
                          'https://png.pngtree.com/element_origin_min_pic/00/00/06/12575cb97a22f0f.jpg',
                      imgposition: 'assets/medalha-primeiro-lugar.png',
                      pontuacao: 0.0,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

_splitfirtsname(String? name) {
  var namesplit = name!.split(' ');
  return namesplit[0];
}

class CustomCircleAvatar extends StatelessWidget {
  final double size;
  final String image;
  final String usuario;
  final double pontuacao;
  final String imgposition;

  const CustomCircleAvatar({
    Key? key,
    required this.size,
    required this.image,
    required this.usuario,
    required this.imgposition,
    required this.pontuacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [Image.asset(imgposition)],
            alignment: AlignmentDirectional.bottomStart,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          usuario,
          style: AppTypography.body,
        ),
        Text(
          '$pontuacao',
          style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )
      ],
    );
  }
}
