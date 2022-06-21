import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../core/enums/request_state.dart';
import 'sign_up_repository.dart';

class SignUpController implements Disposable {
  SignUpRepository repository;
  final signUpRequestState = RxNotifier<RequestState>(RequestState.IDLE);

  SignUpController({required this.repository});

  final _enableButton = RxNotifier<bool>(false);

  bool get enableButton => _enableButton.value;
  set enableButton(bool value) => _enableButton.value = value;

  final _image = RxNotifier<File>(File(''));

  File get image => _image.value;
  set image(File value) => _image.value = value;

  final _imageUrl = RxNotifier<String>('');

  String get imageUrl => _imageUrl.value;
  set imageUrl(String value) => _imageUrl.value = value;

  final _email = RxNotifier<String>('');

  String get email => _email.value;
  set email(String value) => _email.value = value;

  final _emailVerify = RxNotifier<String>('');

  String get emailVerify => _emailVerify.value;
  set emailVerify(String value) => _emailVerify.value = value;

  bool emailIsValid() =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email) &&
      email == emailVerify;

  final _password = RxNotifier<String>('');

  String get password => _password.value;
  set password(String value) => _password.value = value;

  final _passwordVerify = RxNotifier<String>('');

  String get passwordVerify => _passwordVerify.value;
  set passwordVerify(String value) => _passwordVerify.value = value;

  bool passwordIsValid() => password.length >= 6 && password == passwordVerify;

  final _name = RxNotifier<String>('');

  String get name => _name.value;
  set name(String value) => _name.value = value;

  bool nameIsValid() => name.isNotEmpty;

  final _birthDate = RxNotifier<DateTime>(DateTime.now());

  DateTime get birthDate => _birthDate.value;
  set birthDate(DateTime value) => _birthDate.value = value;

  TextEditingController birthDateTextController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1901, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != birthDate) {
      birthDate = picked;
      birthDateTextController.text = UtilData.obterDataDDMMAAAA(birthDate);
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  bool birthDateIsValid() => birthDate != DateTime.now();

  TextEditingController phoneTextController = TextEditingController();

  final _phoneNumber = RxNotifier<String>('');

  String get phoneNumber => _phoneNumber.value;
  set phoneNumber(String value) => _phoneNumber.value = value;

  bool phoneIsValid() => phoneNumber.length == 10 || phoneNumber.length == 11;

  final _cep = RxNotifier<String>('');

  String get cep => _cep.value;
  set cep(String value) => _cep.value = value;

  bool cepIsValid() => cep.isNotEmpty && cep.length == 10;

  final _cpf = RxNotifier<String>('');

  String get cpf => _cpf.value;
  set cpf(String value) => _cpf.value = value;

  bool cpfIsValid() => cpf.isNotEmpty && cpf.length == 14;

  final _isFono = RxNotifier<bool>(false);

  bool get isFono => _isFono.value;
  set isFono(bool value) => _isFono.value = value;

  final _professionalRegion = RxNotifier<String>('');

  String get professionalRegion => _professionalRegion.value;
  set professionalRegion(String value) => _professionalRegion.value = value;

  bool professionalRegionIsValid() => professionalRegion.isNotEmpty;

  final _professionalNumber = RxNotifier<String>('');

  String get professionalNumber => _professionalNumber.value;
  set professionalNumber(String value) => _professionalNumber.value = value;

  bool professionalNumberIsValid() => professionalNumber.isNotEmpty;

  void enableSignUp() {
    if (emailIsValid() &&
        passwordIsValid() &&
        nameIsValid() &&
        cepIsValid() &&
        cpfIsValid() &&
        birthDateIsValid() &&
        (!isFono ||
            (isFono &&
                professionalRegionIsValid() &&
                professionalNumberIsValid()))) {
      enableButton = true;
    } else {
      enableButton = false;
    }
  }

  uploadProfilePic() {
    final storage =
        FirebaseStorage.instanceFor(bucket: "gs://apraxiaapp.appspot.com");
    Reference ref = storage
        .ref("/fotos/fotoPerfil/")
        .child("image1" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(image);
    uploadTask
        .then((value) async => imageUrl = await value.ref.getDownloadURL());
  }

  generateSignUpJson() {
    Map<String, dynamic> json = {};
    json['nome'] = name;
    json['dataNascimento'] = birthDate;
    json['dataDeInicio'] = DateTime.now();
    json['email'] = email;
    json['cpf'] = cpf;
    json['cep'] = cep;
    json['fotoPerfil'] = imageUrl;
    json['telefone'] = phoneNumber;
    json['isFono'] = isFono;
    json['isPremium'] = false;
    json['isAdmin'] = false;
    if (isFono) {
      // json['pacientes'] = [];
      json['regiaoConselho'] = professionalRegion;
      json['numeroConselho'] = professionalNumber;
    } else {
      json['nivel'] = '1';
      json['tentativasAtividades'] = [];
      // json['meuFonoaudiologo'] = '';
    }

    print(json);
    registerUserAndProfile(json);
  }

  registerUserAndProfile(Map<String, dynamic> json) {
    signUpRequestState.value = RequestState.LOADING;
    repository.signUp(json, password);
    signUpRequestState.value = RequestState.SUCCESS;
  }

  @override
  void dispose() {}
}
