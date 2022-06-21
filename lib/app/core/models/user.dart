import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class User {
  String? id;
  String? nome;
  String? cpf;
  String? dataNascimento;
  String? telefone;
  String? celular;
  String? email;
  String? cep;
  String? sexo;
  String? fotoPerfil;
  bool? isFono;
  bool? isAdmin;

  User(
      {this.id,
      this.nome,
      this.cpf,
      this.dataNascimento,
      this.telefone,
      this.celular,
      this.email,
      this.cep,
      this.sexo,
      this.fotoPerfil,
      this.isFono,
      this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    var date = UtilData.obterDataDDMMAAAA(DateTime.parse(
        (json['dataNascimento'] ?? Timestamp.now()).toDate().toString()));

    nome = json['nome'] ?? '';
    cpf = json['cpf'] ?? '';
    cep = json['cep'] ?? '';
    sexo = json['sexo'] ?? '';
    dataNascimento = date;
    telefone = json['telefone'] ?? '';
    celular = json['celular'] ?? '';
    email = json['email'] ?? '';
    fotoPerfil = json['fotoPerfil'] ??
        'https://img.freepik.com/free-icon/important-person_318-10744.jpg?t=st=1645538552~exp=1645539152~hmac=268f4df1741112ca3b8735a233c8d50b8c76ebe5b0aa4d7bf90f1a359824ed8d&w=996';
    isFono = json['isFono'] ?? false;
    isAdmin = json['isAdmin'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['dataNascimento'] = this.dataNascimento;
    data['telefone'] = this.telefone;
    data['celular'] = this.celular;
    data['email'] = this.email;
    data['cep'] = this.cep;
    data['sexo'] = this.sexo;
    data['fotoPerfil'] = this.fotoPerfil;
    data['isFono'] = this.isFono;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
