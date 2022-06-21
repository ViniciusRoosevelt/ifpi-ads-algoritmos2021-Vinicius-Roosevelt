import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/images/app_images.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../core/widgets/input/app_input_text.dart';

import '../forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = Modular.get<ForgotPasswordController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _illustration(height),
                SizedBox(height: 16.0),
                _title(),
                SizedBox(height: 16.0),
                _recoverPasswordForm(height, width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _illustration(double height) => SvgPicture.string(
        splashImage,
        height: height * 0.25,
      );

  _title() => Text(
        'Recupere sua senha',
        style: AppTypography.hx,
        textAlign: TextAlign.center,
      );

  _recoverPasswordForm(double height, double width) => Column(
        children: <Widget>[
          AppInputText(
              labelText: 'E-mail',
              hintText: 'email@example.com',
              onChanged: (newEmail) {
                controller.email = newEmail;
                controller.enableRecoverPassword();
              }),
          SizedBox(height: 16.0),
          RxBuilder(builder: (context) {
            return AppFlatButton(
              onPressed: controller.enableButton
                  ? () {
                      print('Senha Recuperada!');
                    }
                  : null,
              text: 'Recuperar Senha',
              isExpanded: true,
            );
          }),
          SizedBox(height: 8.0),
          AppGhostButton(
            onPressed: () => Modular.to.pop(),
            text: 'Voltar',
            isExpanded: true,
          ),
          SizedBox(height: 16.0),
        ],
      );
}
