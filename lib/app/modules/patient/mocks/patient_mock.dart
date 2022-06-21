import '../../../core/models/patient.dart';

Patient patientMock = Patient.fromJson({
  "nome": "Abília Acosta Alexandrina",
  "cpf": "888.888.888-88",
  "dataNascimento": "01/08/1980",
  "telefone": "(86) 9999-9999",
  "celular": "(86) 99999-9999",
  "nivel": "1",
  "email": "triplea@example.com",
  "isFono": false,
  "fotoPerfil": "https://cdn-icons-png.flaticon.com/512/1226/1226100.png?w=996",
  "dataDeInicio": "20/11/2021",
  "licoes": [
    {
      "id": "1",
      "titulo": "Vogais",
      "corpo": "Treine a pronúncia das vogais",
      "bloqueada": false,
      "atividades": []
    },
    {
      "id": "2",
      "titulo": "Monossílabos",
      "corpo": "Treine a pronúncia de monossílabos",
      "bloqueada": false
    },
    {
      "id": "3",
      "titulo": "Monossílabos - II",
      "corpo": "Treina a pronúncia de monossílabos - II",
      "bloqueada": false
    },
    {
      "id": "4",
      "titulo": "Dissílabos",
      "corpo": "Treine a pronúncia de dissílabos",
      "bloqueada": true
    },
    {
      "id": "5",
      "titulo": "Dissílabos - II",
      "corpo": "Treine a pronúncia de dissílabos - II",
      "bloqueada": true
    }
  ]
});
