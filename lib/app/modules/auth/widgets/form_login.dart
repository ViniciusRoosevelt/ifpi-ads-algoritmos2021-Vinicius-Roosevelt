import 'package:apprax/app/core/widgets/input/app_input_text.dart';
import 'package:flutter/cupertino.dart';

import '../auth_controller.dart';
import 'input.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key, AuthController? authController}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppInputText(
            labelText: 'E-mail',
            hintText: 'Digite seu e-mail...',
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          AppInputText(
            labelText: 'Senha',
            hintText: 'Digite sua senha...',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
