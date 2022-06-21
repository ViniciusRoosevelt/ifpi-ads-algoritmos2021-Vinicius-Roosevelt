import 'package:apprax/app/core/styles/typography.dart';
import 'package:flutter/cupertino.dart';

class Separated extends StatelessWidget {
  const Separated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.3,
          height: 1,
          decoration: const BoxDecoration(color: Color(0xff52A3D0)),
        ),
        Container(
          alignment: Alignment.center,
          width: width * 0.3,
          child: Text(
            'Ou então',
            style: AppTypography.bodyEmphasis,
          ),
        ),
        Container(
          width: width * 0.3,
          height: 1,
          decoration: const BoxDecoration(color: Color(0xff52A3D0)),
        ),
      ],
    );
  }
}
