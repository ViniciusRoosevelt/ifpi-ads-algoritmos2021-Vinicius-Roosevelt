import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/doctor.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';

class ResponsibleDoctor extends StatelessWidget {
  final Doctor? doctor;
  const ResponsibleDoctor({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(2.0),
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
                      padding: const EdgeInsets.all(4.0),
                      child: doctor!.fotoPerfil!.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(doctor!.fotoPerfil!),
                            )
                          : CircleAvatar(
                              backgroundColor: AppColors.primary,
                            )
                      // CircularProfileAvatar(
                      //   doctor!.fotoPerfil!,
                      //   radius: 30,
                      // )
                      ),
                  SizedBox(
                    width: width * .7,
                    child: Text(
                      doctor!.nome!.isNotEmpty
                          ? '${doctor?.nome ?? 'Ana Romanov'}'
                          : 'Você ainda não tem um fono',
                      style: AppTypography.h2,
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
  }
}
