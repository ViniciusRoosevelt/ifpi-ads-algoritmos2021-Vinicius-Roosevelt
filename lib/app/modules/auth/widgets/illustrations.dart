import 'package:apprax/app/core/images/app_images.dart';
import 'package:apprax/shared/components/logo_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Illustration extends StatelessWidget {
  const Illustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0xff52A3D0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(180.0),
                bottomRight: Radius.circular(180.0),
              ),
            ),
          ),
        ),
        Positioned(
          top: -25,
          child: Container(
            width: 180,
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(180.0),
                  bottomRight: Radius.circular(180.0),
                ),
                color: Colors.white),
          ),
        ),
        Positioned(
          top: -15,
          child: Container(
            width: 50,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xff52A3D0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50.0),
              ),
            ),
          ),
        ),
        Positioned(
            top: height * 0.03,
            child: SvgPicture.string(
              authImage,
              width: width * .99,
            )),
      ],
    );
  }
}
