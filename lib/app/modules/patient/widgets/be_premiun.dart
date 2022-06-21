import 'package:apprax/app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/images/badge_premiun.dart';
import '../../../core/styles/typography.dart';
import '../pages/home/pages/home_page.dart';

class BePremium extends StatelessWidget {
  Color? color;
  Color? colorTap;
  BePremium({
    Key? key,
    this.color,
    this.colorTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Teste(
              title: 'Seja Premium',
              description:
                  'Se torne um de nossos parceiros \n        e tenha acesso a nossa \n                  lista de fonos',
              buttonText: "buttonText",
              image: 'Test',
            );
          });
    }

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: colorTap,
              splashColor: colorTap,
              onTap: () => _showMyDialog(),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Seja  ',
                        style: AppTypography.body.copyWith(color: color),
                      ),
                      SvgPicture.string(
                        badgePremiun,
                        color: color,
                      ),
                    ],
                  ),
                  Text('Premium',
                      style: AppTypography.body.copyWith(color: color))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Teste extends StatelessWidget {
  final String title, description, buttonText;
  final String image;
  const Teste(
      {required this.title,
      required this.description,
      required this.buttonText,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ],
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        primary: Color(0xFF009AEB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Ok'),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 30,
            ),
            radius: 30,
          ),
        )
      ]),
    );
  }
}
