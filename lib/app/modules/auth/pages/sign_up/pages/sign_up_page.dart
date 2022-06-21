import 'dart:io';

import 'package:apprax/app/core/widgets/buttons/app_text_button.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/typography.dart';
import '../../../../../core/images/app_images.dart';
import '../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../core/widgets/input/app_input_text.dart';

import '../../../../../core/widgets/notifications/success_notification.dart';
import '../../../../../core/widgets/simple_loader_widget.dart';
import '../sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  XFile? imageFile;

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
        controller.image = File(pickedFile.path);
        controller.uploadProfilePic();
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
        controller.image = File(pickedFile.path);
        controller.uploadProfilePic();
      }
    });
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 50,
      child: imageFile != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.file(
                File(imageFile!.path),
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50)),
              width: 100,
              height: 100,
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey[800],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomScaffold(
        title: 'Cadastre-se',
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              width: width,
              // height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _avatar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppTextButton(
                        onPressed: () => getImageFromGallery(),
                        text: 'Escolher da galeria',
                        leftIcon: Icons.photo_library,
                      ),
                      AppTextButton(
                        onPressed: () => getImageFromCamera(),
                        text: 'Tirar foto',
                        leftIcon: Icons.photo_camera,
                      ),
                    ],
                  ),
                  _signUpForm(height, width),
                ],
              ),
            ),
          ),
        ));
  }

  _illustration(double height) => SvgPicture.string(
        splashImage,
        height: height * 0.25,
      );

  _title() => Text('Cadastre-se', style: AppTypography.hx);

  _signUpForm(double height, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppInputText(
            labelText: 'Nome',
            hintText: 'Digite seu nome...',
            onChanged: (newName) {
              controller.name = newName;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            labelText: 'E-mail',
            hintText: 'email@example.com',
            onChanged: (newEmail) {
              controller.email = newEmail;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            labelText: 'Verifique seu e-mail',
            hintText: 'Deve ser igual ao e-mail digitado',
            onChanged: (newEmail) {
              controller.emailVerify = newEmail;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            labelText: 'Senha',
            hintText: 'Mínimo de 6 caracteres',
            obscureText: true,
            onChanged: (newPassword) {
              controller.password = newPassword;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            labelText: 'Verifique sua senha',
            hintText: 'Deve ser igual à senha digitada',
            obscureText: true,
            onChanged: (newPassword) {
              controller.passwordVerify = newPassword;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        Row(
          children: [
            Container(
              width: width * .6,
              child: AppInputText(
                  labelText: 'Data de Nascimento',
                  enabled: false,
                  controller: controller.birthDateTextController,
                  onChanged: (newBirthDate) {
                    controller.birthDate = DateTime.parse(newBirthDate);
                    controller.enableSignUp();
                  }),
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today_rounded,
                color: AppColors.primary,
              ),
              onPressed: () => controller.selectDate(context),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        AppInputText(
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
            labelText: 'Telefone',
            hintText: 'Digite seu telefone',
            onChanged: (newPhoneNumber) {
              controller.phoneNumber = newPhoneNumber;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            labelText: 'CEP',
            hintText: 'Digite seu CEP',
            onChanged: (newCep) {
              controller.cep = newCep;
              controller.enableSignUp();
            }),
        SizedBox(height: 8.0),
        AppInputText(
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            labelText: 'CPF',
            hintText: 'Digite seu CPF',
            onChanged: (newCpf) {
              controller.cpf = newCpf;
              controller.enableSignUp();
            }),
        SizedBox(height: 16.0),
        Text(
          'Eu sou:',
          style: AppTypography.h2,
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Paciente',
              style: AppTypography.bodyEmphasis,
            ),
            RxBuilder(builder: (_) {
              return Platform.isAndroid
                  ? Switch(
                      activeColor: AppColors.primary,
                      inactiveThumbColor: AppColors.primary,
                      activeTrackColor: AppColors.primary.withOpacity(.4),
                      inactiveTrackColor: AppColors.primary.withOpacity(.4),
                      onChanged: (bool value) {
                        controller.isFono = !controller.isFono;
                        controller.professionalNumber = '';
                        controller.professionalRegion = '';
                        controller.enableSignUp();
                      },
                      value: controller.isFono,
                    )
                  : CupertinoSwitch(
                      activeColor: AppColors.primary,
                      onChanged: (bool value) {
                        controller.isFono = !controller.isFono;
                        controller.professionalNumber = '';
                        controller.professionalRegion = '';
                        controller.enableSignUp();
                      },
                      value: controller.isFono,
                    );
            }),
            Text(
              'Fonoaudióloga (o)',
              style: AppTypography.bodyEmphasis,
            ),
          ],
        ),
        SizedBox(height: 16.0),
        RxBuilder(builder: (context) {
          if (controller.isFono) {
            return Column(
              children: [
                Text(
                  'Digite seu número do conselho (do local de atuação):',
                  style: AppTypography.h2,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width * .3,
                      child: AppInputText(
                          maxLength: 1,
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          labelText: 'Região',
                          onChanged: (newRegionNumber) {
                            controller.professionalRegion = newRegionNumber;
                            controller.enableSignUp();
                          }),
                    ),
                    Container(
                      width: width * .5,
                      child: AppInputText(
                          maxLength: 6,
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          labelText: 'Número',
                          onChanged: (newProfessionalNumber) {
                            controller.professionalNumber =
                                newProfessionalNumber;
                            controller.enableSignUp();
                          }),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Text(
              'Clique no botão abaixo para finalizar o cadastro:',
              style: AppTypography.h2,
            );
          }
        }),
        SizedBox(height: 16.0),
        RxBuilder(builder: (context) {
          return AppFlatButton(
            onPressed: controller.enableButton
                ? () {
                    controller.generateSignUpJson();
                    if (controller.signUpRequestState.value ==
                        RequestState.SUCCESS) {
                      Modular.to.pop();
                      SuccessNotification().call(
                          title: 'Sucesso',
                          subtitle: 'Usuário criado com sucesso!');
                    } else {
                      showCupertinoDialog(
                          context: context,
                          builder: (_) {
                            return SimpleLoaderWidget(
                              key: Key('createUserLoader'),
                            );
                          });
                    }
                  }
                : null,
            text: 'Cadastre-se',
            isExpanded: true,
          );
        }),
        SizedBox(
          height: 8.0,
        ),
        AppGhostButton(
          onPressed: () => Modular.to.pop(),
          text: 'Voltar',
          isExpanded: true,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
