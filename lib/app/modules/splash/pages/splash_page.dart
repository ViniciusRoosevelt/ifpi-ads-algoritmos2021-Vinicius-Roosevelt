import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/images/app_images.dart';
import '../../../core/services/local_data/local_data.dart';

import '../../../core/widgets/simple_loader_widget.dart';
import '../../auth/auth_controller.dart';
import '../splash_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Modular.get<AuthController>();
    // Timer _timer = new Timer(const Duration(milliseconds: 2000), () {
    //   authController.loginWithLocalStorage(); Login com local storage antes do Firebase
    // });
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            Timer(const Duration(milliseconds: 1000), () async {
              await authController.loginWithLocalStorage();
            });
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SimpleLoaderWidget(
                key: Key('splashLoader'),
              ));
            }
            return Container(
              child: Center(
                child: SvgPicture.string(splashImage),
              ),
            );
          }),
    );
  }
}
