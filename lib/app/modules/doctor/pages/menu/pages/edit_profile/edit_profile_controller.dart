import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../core/enums/request_state.dart';
import '../../../../core/models/doctor.dart';
import 'edit_profile_repository.dart';

class EditProfileController implements Disposable {
  EditProfileRepository repository;
  final requestState = RxNotifier<RequestState>(RequestState.IDLE);

  EditProfileController({required this.repository});

  late Future<QuerySnapshot<Map<String, dynamic>>> userData;

  final _enableButton = RxNotifier<bool>(false);

  bool get enableButton => _enableButton.value;
  set enableButton(bool value) => _enableButton.value = value;

  final _doctorUserId = RxNotifier<String>('');

  String get doctorUserId => _doctorUserId.value;
  set doctorUserId(String doctor) {
    _doctorUserId.value = doctor;
  }

  final _doctor = RxNotifier<Doctor>(Doctor());

  Doctor get doctor => _doctor.value;
  set doctor(Doctor doctor) => _doctor.value = doctor;

  void getProfileData() async {
    requestState.value = RequestState.LOADING;
    userData = repository.fetchUserData(doctorUserId);
    userData.then((value) {
      doctor = Doctor.fromJson(value.docs.first.data());
      doctor.id = doctorUserId;
    });
    requestWasSuccessful();
  }

  void requestWasSuccessful() {
    requestState.value = RequestState.SUCCESS;
  }

  final _image = RxNotifier<File>(File(''));

  File get image => _image.value;
  set image(File value) => _image.value = value;

  final _imageUrl = RxNotifier<String>('');

  String get imageUrl => _imageUrl.value;
  set imageUrl(String value) => _imageUrl.value = value;

  bool imageHasChanged() => (imageUrl != '' || image.path != '');

  final _email = RxNotifier<String>('');

  String get email => _email.value;
  set email(String value) => _email.value = value;

  bool emailIsValid() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

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

  final _isTransferredFono = RxNotifier<bool>(false);

  bool get isTransferredFono => _isTransferredFono.value;
  set isTransferredFono(bool value) => _isTransferredFono.value = value;

  final _professionalRegion = RxNotifier<String>('');

  String get professionalRegion => _professionalRegion.value;
  set professionalRegion(String value) => _professionalRegion.value = value;

  bool professionalRegionIsValid() => professionalRegion != '';

  final _professionalNumber = RxNotifier<String>('');

  String get professionalNumber => _professionalNumber.value;
  set professionalNumber(String value) => _professionalNumber.value = value;

  bool professionalNumberIsValid() =>
      professionalNumber != '' && professionalNumber.length >= 3;

  void enableEditProfile() {
    if (emailIsValid() ||
        nameIsValid() ||
        cepIsValid() ||
        birthDateIsValid() ||
        imageHasChanged() ||
        (isTransferredFono &&
            professionalRegionIsValid() &&
            professionalNumberIsValid())) {
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

  generateEditProfileJson() {
    Map<String, dynamic> json = {};
    if (name != '') json['nome'] = name;
    if (birthDate != DateTime.now()) json['dataNascimento'] = birthDate;
    if (email != '') json['email'] = email;
    if (cep != '') json['cep'] = cep;
    if (imageUrl != '') json['fotoPerfil'] = imageUrl;
    if (phoneNumber != '') json['telefone'] = phoneNumber;
    if (isTransferredFono) {
      json['regiaoConselho'] = professionalRegion;
      json['numeroConselho'] = professionalNumber;
    }

    updateProfile(json);
  }

  updateProfile(Map<String, dynamic> json) {
    requestState.value = RequestState.LOADING;
    repository.updateData(json, doctorUserId);
    requestState.value = RequestState.SUCCESS;
  }

  @override
  void dispose() {}
}
