import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Link extends StatelessWidget {
  const Link({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        alignment: Alignment.topRight,
        child: InkWell(
          child: const Text('Esqueceu a senha?'),
          onTap: () => Modular.to.navigate('/ForgotAcess'),
        ),
      ),
    );
  }
}
