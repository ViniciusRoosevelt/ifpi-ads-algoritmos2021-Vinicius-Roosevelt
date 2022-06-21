import 'dart:io';

import 'package:apprax/app/core/widgets/buttons/app_text_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../../core/enums/request_state.dart';
import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/typography.dart';
import '../../../../../../../core/widgets/buttons/app_flat_button.dart';
import '../../../../../../../core/widgets/buttons/app_ghost_button.dart';
import '../../../../../../../core/widgets/custom_scaffold.dart';
import '../../../../../../../core/widgets/input/app_input_text.dart';
import '../../../../../../../core/widgets/notifications/success_notification.dart';
import '../../../../../../../core/widgets/simple_loader_widget.dart';

import '../edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends ModularState<EditProfilePage, EditProfileController> {
  @override
  void initState() {
    super.initState();
    controller.doctorUserId = Modular.args.data;
    controller.getProfileData();
  }

  XFile? imageFile;

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
        controller.image = File(pickedFile.path);
        controller.uploadProfilePic();
        controller.enableButton = true;
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
        controller.enableButton = true;
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
            : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  controller.doctor.fotoPerfil ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      body: FutureBuilder<QuerySnapshot>(
          future: controller.userData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SimpleLoaderWidget(key: Key('pageLoader'));
            } else {
              return SafeArea(
                  child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          width: width,
                          // height: height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _avatar(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              AppInputText(
                                  labelText: 'Nome',
                                  hintText: 'Digite seu nome...',
                                  onChanged: (newName) {
                                    controller.name = newName;
                                    controller.enableEditProfile();
                                  }),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Container(
                                    width: width * .6,
                                    child: AppInputText(
                                        labelText: 'Data de Nascimento',
                                        enabled: false,
                                        controller:
                                            controller.birthDateTextController,
                                        onChanged: (newBirthDate) {
                                          controller.birthDate =
                                              DateTime.parse(newBirthDate);
                                          controller.enableEditProfile();
                                        }),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.calendar_today_rounded,
                                      color: AppColors.primary,
                                    ),
                                    onPressed: () =>
                                        controller.selectDate(context),
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
                                    controller.enableEditProfile();
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
                                    controller.enableEditProfile();
                                  }),
                              SizedBox(height: 16.0),
                              Text(
                                'Estou transferindo meu registro:',
                                style: AppTypography.h2,
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Não',
                                    style: AppTypography.bodyEmphasis,
                                  ),
                                  RxBuilder(builder: (_) {
                                    return Platform.isAndroid
                                        ? Switch(
                                            activeColor: AppColors.primary,
                                            inactiveThumbColor:
                                                AppColors.primary,
                                            activeTrackColor: AppColors.primary
                                                .withOpacity(.4),
                                            inactiveTrackColor: AppColors
                                                .primary
                                                .withOpacity(.4),
                                            onChanged: (bool value) {
                                              controller.isTransferredFono =
                                                  !controller.isTransferredFono;
                                              controller.professionalNumber =
                                                  '';
                                              controller.professionalRegion =
                                                  '';
                                              // controller.enableEditProfile();
                                              if (controller
                                                      .isTransferredFono ==
                                                  false)
                                                controller.enableButton = false;
                                            },
                                            value: controller.isTransferredFono,
                                          )
                                        : CupertinoSwitch(
                                            activeColor: AppColors.primary,
                                            onChanged: (bool value) {
                                              controller.isTransferredFono =
                                                  !controller.isTransferredFono;
                                              controller.professionalNumber =
                                                  '';
                                              controller.professionalRegion =
                                                  '';
                                              if (controller
                                                      .isTransferredFono ==
                                                  false)
                                                controller.enableButton = false;
                                            },
                                            value: controller.isTransferredFono,
                                          );
                                  }),
                                  Text(
                                    'Sim',
                                    style: AppTypography.bodyEmphasis,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              RxBuilder(builder: (context) {
                                if (controller.isTransferredFono) {
                                  return Column(
                                    children: [
                                      Text(
                                        'Digite seu número do conselho (do local de atuação):',
                                        style: AppTypography.h2,
                                      ),
                                      SizedBox(height: 16.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: width * .3,
                                            child: AppInputText(
                                                maxLength: 1,
                                                formatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                labelText: 'Região',
                                                onChanged: (newRegionNumber) {
                                                  controller
                                                          .professionalRegion =
                                                      newRegionNumber;
                                                  controller
                                                      .enableEditProfile();
                                                }),
                                          ),
                                          Container(
                                            width: width * .5,
                                            child: AppInputText(
                                                maxLength: 6,
                                                formatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                labelText: 'Número',
                                                onChanged:
                                                    (newProfessionalNumber) {
                                                  controller
                                                          .professionalNumber =
                                                      newProfessionalNumber;
                                                  controller
                                                      .enableEditProfile();
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
                                          controller.generateEditProfileJson();
                                          if (controller.requestState.value ==
                                              RequestState.SUCCESS) {
                                            Navigator.of(context).pop();
                                            SuccessNotification().call(
                                                title: 'Sucesso',
                                                subtitle:
                                                    'Suas alterações serão aplicadas em breve!');
                                          } else {
                                            showCupertinoDialog(
                                                context: context,
                                                builder: (_) {
                                                  return SimpleLoaderWidget(
                                                    key:
                                                        Key('createUserLoader'),
                                                  );
                                                });
                                          }
                                        }
                                      : null,
                                  text: 'Salvar alterações',
                                  isExpanded: true,
                                );
                              }),
                            ],
                          ))));
            }
          }),
      title: 'Editar perfil',
    );
  }
}
