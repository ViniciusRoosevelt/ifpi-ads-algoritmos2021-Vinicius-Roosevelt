import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/images/trophy_image.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';

class AccessRanking extends StatelessWidget {
  const AccessRanking(
      {Key? key, required this.rankingRoute, required this.rankingTitle})
      : super(key: key);

  final String rankingRoute;
  final String rankingTitle;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 10),
                  child: Text(
                    rankingTitle,
                    style: AppTypography.h1,
                    textScaleFactor: height * 0.0012,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Modular.to.pushNamed(rankingRoute);
              },
              child: Container(
                width: width * .85,
                height: height * .09,
                decoration: BoxDecoration(
                  color: AppColors.black_04,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.string(trophyImage),
                    ),
                    const Text(
                      'Acompanhe seu desempenho\nem relação aos outros usuários',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
