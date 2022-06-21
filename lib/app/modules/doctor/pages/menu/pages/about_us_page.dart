import 'package:flutter/material.dart';

import '../../../../../core/models/doctor.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/custom_scaffold.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return CustomScaffold(
        key: Key('aboutUsScaffold'),
        title: 'Sobre Nós',
        body: _body(height, width));
  }

  _body(double height, double width) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * .05, height * .1, width * .05, 0.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tristique egestas molestie. Donec id sagittis risus. Pellentesque efficitur a turpis sit amet condimentum. Donec et urna a lacus vestibulum aliquam in et eros. In hac habitasse platea dictumst. Maecenas gravida enim vel neque dictum sodales. Nullam vitae mauris sem.\nAliquam ut nunc commodo, interdum ex id, pulvinar risus. Pellentesque laoreet tempor quam, et lacinia mi finibus ac. Donec egestas finibus tempus. Pellentesque placerat enim ut eros porta, tincidunt condimentum dolor sagittis. Integer laoreet tincidunt tellus, gravida sollicitudin arcu dictum vel. Nam risus augue, pretium ut erat vel, interdum auctor ante. Sed velit felis, posuere ut libero ac, rhoncus vulputate risus. Pellentesque vehicula erat nisi, vel ultricies arcu faucibus et. Vestibulum a quam non turpis rutrum placerat eu in ante. Maecenas varius nulla sit amet metus consectetur, sodales varius tortor pulvinar.',
                style: AppTypography.h2,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
}
