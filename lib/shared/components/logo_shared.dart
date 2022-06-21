import 'package:apprax/app/core/styles/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoMsg extends StatelessWidget {
  final String title;
  final String description;
  const LogoMsg({Key? key, required this.title, required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(children: [
        SvgPicture.asset('assets/logo.svg'),
        Positioned(
          right: 10,
          top: 37,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: AppTypography.hx.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    description,
                    style: AppTypography.caption.copyWith(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
