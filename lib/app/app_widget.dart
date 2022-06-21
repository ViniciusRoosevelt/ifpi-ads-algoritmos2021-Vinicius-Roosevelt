import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:bot_toast/bot_toast.dart';

import 'core/styles/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      title: 'Apprax',
      theme: AppTheme.appTheme(),
      navigatorObservers: [BotToastNavigatorObserver()],
      darkTheme: AppTheme.appTheme(),
    ).modular();
  }
}
