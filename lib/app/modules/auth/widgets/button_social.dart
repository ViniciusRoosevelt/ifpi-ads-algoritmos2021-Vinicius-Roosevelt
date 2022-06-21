import 'package:apprax/app/core/styles/typography.dart';
import 'package:flutter/material.dart';

class ButtonSocial extends StatelessWidget {
  final String titleBtn;
  final String icon;
  final VoidCallback onTap;

  const ButtonSocial(
      {Key? key,
      required this.titleBtn,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xff52A3D0), width: 1.0)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(icon, width: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 1,
                height: 50,
                color: const Color(0xff52A3D0),
              ),
            ),
            Text(
              titleBtn,
              style: AppTypography.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
