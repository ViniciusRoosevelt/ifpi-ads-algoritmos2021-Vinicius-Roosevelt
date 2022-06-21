// ignore_for_file: unused_local_variable, file_names

import 'package:apprax/app/core/widgets/custom_scaffold.dart';
import 'package:apprax/app/modules/patient/widgets/be_premiun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../ranking/mocks/ranking_mock.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../ranking_controller.dart';
import '../../../widgets/triade_ranking_geral.dart';

class RankingGeralPage extends StatefulWidget {
  const RankingGeralPage({Key? key}) : super(key: key);
  @override
  RankingGeralState createState() => RankingGeralState();
}

class RankingGeralState extends State<RankingGeralPage> {
  final RankingController controller = Modular.get();
  var patient = rankingMock.pacientes;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: _appBar('Ranking Geral'), body: _listviewRanking(patient));
  }

  _appBar(String name) => AppBar(
        leading: AppTextButton(
          text: 'Voltar',
          onPressed: () => Modular.to.popUntil((route) => route == '/patient'),
        ),
        elevation: 0,
        title: Text(
          name,
          style: AppTypography.h1.copyWith(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
        actions: [
          BePremium(
            colorTap: Colors.white,
            color: AppColors.primary,
          )
        ],
      );
  _splitfirstname(String? name) {
    var namesplit = name!.split(' ');
    return '${namesplit[0]} ${namesplit[1]}';
  }

  _listviewRanking(var patient) {
    return ListView.builder(
      itemCount: patient.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const TriadeRankingGeral();
        }
        if (index < 3) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "$indexº",
                    style: AppTypography.h2,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    color: AppColors.infoDark.withOpacity(.2),
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(patient[index].fotoPerfil!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(_splitfirstname(patient[index].nome!),
                          style: AppTypography.body),
                    ),
                    Text(
                      '${patient[index].notalGeral.value}',
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
