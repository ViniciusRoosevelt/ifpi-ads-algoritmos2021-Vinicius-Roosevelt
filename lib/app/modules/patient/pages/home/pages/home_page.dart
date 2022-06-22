import 'dart:ffi';

import 'package:apprax/app/core/models/doctor.dart';
import 'package:apprax/app/modules/patient/pages/home/home_controller.dart';
import 'package:apprax/app/modules/patient/widgets/be_premiun.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/images/badge_premiun.dart';
import '../../../../../core/models/patient.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';
import '../../../mocks/patient_mock.dart';
import '../widgets/access_ranking.dart';
import '../widgets/last_lessons.dart';
import '../widgets/responsible_doctor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var data = Modular.args.data;

  void initState() {
    String? meuFono = data['meuFonoaudiologo'];

    super.initState();
    controller.getLessonList();
    controller.getDoctor(meuFono);
    controller.getPremium();
    controller.getFonos();
  }

  @override
  Widget build(BuildContext context) {
    // var data = Modular.args.data;
    print(controller.getFonos());
    Patient user = Patient.fromJson(data);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RxBuilder(builder: (_) {
      return Scaffold(
        appBar: _appBar(height, user.nome ?? ''),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            addAutomaticKeepAlives: false,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LastLessons(
                patient: user,
              ),

              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: controller.meuFonoaudiologo,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SimpleLoaderWidget(
                        key: Key('lessonLoader'),
                      );
                    } else {
                      if (controller.isPremium.value == false) {
                        return _PatientPremium(
                            controller.isPremium.value, width, height);
                      } else {
                        var doctorData = snapshot.data!.data();
                        print('DOCTOR DATA: ${doctorData}');
                        Doctor doctor = Doctor.fromJson(doctorData!);
                        return ResponsibleDoctor(
                          doctor: doctor,
                        );
                      }
                    }
                  }),

              /*     FutureBuilder(
                future: controller.todosFonos,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SimpleLoaderWidget(key: Key('Loading'));
                  } else {
                    print(snapshot);

                    return Container();
                  }
                }), */
              // const AccessRanking(
              //   rankingTitle: 'Ranking Geral:',
              //   rankingRoute: '/ranking/ranking-geral',
              // ),
              // const AccessRanking(
              //   rankingTitle: 'Ranking por Lição:',
              //   rankingRoute: '/ranking/ranking-licao',
              // ),
            ],
          ),
        ),
      );
    });
  }

  _appBar(
    double height,
    String name,
  ) =>
      AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: height * .25,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
          ),
          title: _title(_splitfirtsname(name), height),
          actions: [_isPremium(controller.getPremium())]);

  _title(String name, double height) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Home\n',
            style: AppTypography.body,
          ),
          Text(
            'Olá, $name!',
            style: AppTypography.hx,
            textScaleFactor: height * 0.0011,
          ),
          Text(
            'Vamos Praticar?',
            style: AppTypography.hx,
            textScaleFactor: height * 0.0011,
          ),
        ],
      );
  _splitfirtsname(String? name) {
    var namesplit = name!.split(' ');
    return namesplit[0];
  }
}

Widget _isPremium(
  bool ispremium,
) {
  if (ispremium == false) {
    return BePremium(
      colorTap: AppColors.primary,
    );
  } else {
    return Container();
  }
}

Widget _PatientPremium(bool _ispremium, width, height) {
  if (_ispremium == false) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Seu Fonoaudiólogo:',
                  style: AppTypography.h1,
                  textScaleFactor: height * 0.0012,
                ),
                SizedBox(
                  width: width * .2,
                  height: height * .06,
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: Text('Ver outros',
                //       style: AppTypography.button
                //           .copyWith(color: AppColors.black)),
                // )
              ],
            ),
            Container(
              width: width * .85,
              height: height * .09,
              decoration: BoxDecoration(
                color: AppColors.black_04,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        child: SvgPicture.string(
                          badgePremiun,
                          color: Colors.white,
                        ),
                      )
                      // CircularProfileAvatar(
                      //   doctor!.fotoPerfil!,
                      //   radius: 30,
                      // )
                      ),
                  SizedBox(
                    width: width * .7,
                    child: Text(
                      'Função Premium',
                      style: AppTypography.h1,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}
