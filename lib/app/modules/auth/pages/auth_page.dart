import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../core/styles/typography.dart';
import '../../../core/widgets/buttons/app_flat_button.dart';
import '../../../core/widgets/buttons/app_text_button.dart';
import '../../../core/widgets/buttons/app_ghost_button.dart';

import '../../../core/widgets/input/app_input_text.dart';
import '../../../core/widgets/simple_loader_widget.dart';
import '../auth_controller.dart';
import '../widgets/button_social.dart';
import '../widgets/illustrations.dart';
import '../widgets/separated.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                _illustration(width, height),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _title(),
                      SizedBox(height: 16.0),
                      _loginForm(height, width),
                      // Separated(),
                      // _socialLogin(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  _illustration(double width, double height) => Container(
        width: width,
        height: height * 0.30,
        child: const Illustration(),
      );

  _title() => Text('Conecte-se', style: AppTypography.hx);

  _loginForm(double height, double width) => StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            AppInputText(
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail...',
                onChanged: (newEmail) {
                  controller.email = newEmail;
                  controller.enableLogin();
                }),
            SizedBox(height: 8.0),
            AppInputText(
                labelText: 'Senha',
                hintText: 'Digite sua senha...',
                obscureText: true,
                onChanged: (newPassword) {
                  controller.password = newPassword;
                  controller.enableLogin();
                }),
            SizedBox(height: height * .05),
            // Container(
            //     alignment: Alignment.topRight,
            //     child: AppTextButton(
            //       onPressed: () =>
            //           Modular.to.pushNamed('/auth/forgot-password'),
            //       text: 'Esqueceu a senha?',
            //     )),
            RxBuilder(builder: (context) {
              return AppFlatButton(
                onPressed: controller.enableButton
                    ? () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => const Center(
                                  child: SimpleLoaderWidget(
                                    key: Key('authKey'),
                                  ),
                                ));

                        controller.login();
                      }
                    : null,
                text: 'Entrar',
                isExpanded: true,
              );
            }),
            SizedBox(height: 8.0),
            AppGhostButton(
              onPressed: () => Modular.to.pushNamed('/auth/sign-up'),
              text: 'Cadastre-se',
              isExpanded: true,
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        );
      });

  _socialLogin() => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonSocial(
                titleBtn: "Entrar com Google",
                onTap: () => {print("google login")},
                icon: 'assets/google-icon.png'),
          ),
          // ButtonSocial(
          //     titleBtn: "Entrar com Facebook",
          //     onTap: () => {print("facebook login")},
          //     icon: 'assets/facebook_icon.png')
        ],
      );
}
