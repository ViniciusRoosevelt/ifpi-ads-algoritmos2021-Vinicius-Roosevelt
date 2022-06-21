import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../../core/widgets/input/app_input_text.dart';

class RejectAlert extends StatelessWidget {
  const RejectAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text("Atenção"),
      content: Container(
        height: height * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Deseja realmente recusar o paciente?"),
            AppInputText(
              hintText: 'Deseja justificar? (opcional)',
              maxLines: 5,
            ),
          ],
        ),
      ),
      actions: [
        _cancelButton(),
        _confirmButton(),
      ],
    );
  }

  _cancelButton() => AppTextButton(
        text: "Cancelar",
        onPressed: () {
          Modular.to.pop(false);
        },
      );
  _confirmButton() => AppTextButton(
        text: "Confirmar",
        onPressed: () {
          Modular.to.pop(true);
        },
      );
}
