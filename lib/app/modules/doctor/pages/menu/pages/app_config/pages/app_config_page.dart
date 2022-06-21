import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../app_config_controller.dart';

class AppConfigPage extends StatefulWidget {
  AppConfigPage({Key? key}) : super(key: key);

  @override
  State<AppConfigPage> createState() => _AppConfigPageState();
}

class _AppConfigPageState extends State<AppConfigPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return CustomScaffold(
        key: Key('appConfigScaffold'), title: 'Configurações', body: _body());
  }

  _body() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('App Config Page'),
          ),
        ],
      );
}
