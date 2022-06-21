import '../../../core/models/doctor.dart';

class DoctorMock {
  static Doctor doctorMock = Doctor.fromJson({
    'nome': 'Ana Ágata da Silva Sauro',
    'cpf': '123.456.789-09',
    'dataNascimento': '08/11/2000',
    'telefone': '(86) 9999-9999',
    'celular': '(86) 99999-9999',
    'email': 'anahtinhafono@example.com',
    'fotoPerfil':
        'https://cdn-icons-png.flaticon.com/512/1226/1226100.png?w=996',
    'isFono': true,
    'pacientes': [
      {
        'nome': 'José Fulano de Tal de Tal de Tal de Tal de Tal de Tal de Tal',
        'cpf': '999.999.999-99',
        'dataNascimento': '08/01/1978',
        'telefone': '(86) 9999-9999',
        'celular': '(86) 99999-9999',
        'email': 'josepeidon@example.com',
        'isFono': false,
        'fotoPerfil':
            'https://cdn-icons-png.flaticon.com/512/1253/1253654.png?w=996',
        'dataDeInicio': '17/10/2020',
        'licoes': [
          {
            'id': '1',
            'titulo': 'Vogais',
            'corpo': 'Treine as vogais',
            'atividades': [
              {
                'id': '1',
                'titulo': 'Vogal A',
                'corpo': 'Hora de treinar a vogal A',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '10'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '11'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '20'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '4'
                  },
                ],
              },
              {
                'id': '2',
                'titulo': 'Vogal E',
                'corpo': 'Hora de treinar a vogal E',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '9'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '13'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '5'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '7'
                  },
                ],
              },
              {
                'id': '3',
                'titulo': 'Vogal I',
                'corpo': 'Hora de treinar a vogal I',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '63.0',
                    'quantidadeGravacoes': '16'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '100.0',
                    'quantidadeGravacoes': '3'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '71.0',
                    'quantidadeGravacoes': '4'
                  },
                ],
              },
            ],
          },
          {
            'id': '2',
            'titulo': 'Sílabas com B',
            'corpo': 'Treine as vogais acompanhadas da consoante B',
            'atividades': [
              {
                'id': '1',
                'titulo': 'Sílaba BA',
                'corpo': 'Hora de treinar a sílaba BA',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '1'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '5'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '14'
                  },
                ],
              },
              {
                'id': '2',
                'titulo': 'sílaba BE',
                'corpo': 'Hora de treinar a sílaba BE',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '7'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '11'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '1'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '2'
                  },
                ],
              },
              {
                'id': '3',
                'titulo': 'sílaba BI',
                'corpo': 'Hora de treinar a sílaba BI',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '63.0',
                    'quantidadeGravacoes': '4'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '100.0',
                    'quantidadeGravacoes': '2'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '71.0',
                    'quantidadeGravacoes': '9'
                  },
                ],
              },
            ],
          },
        ]
      },
      {
        'nome': 'Abília Acosta Alexandrina',
        'cpf': '888.888.888-88',
        'dataNascimento': '01/08/1980',
        'telefone': '(86) 9999-9999',
        'celular': '(86) 99999-9999',
        'email': 'triplea@example.com',
        'isFono': false,
        'fotoPerfil':
            'https://cdn-icons-png.flaticon.com/512/1226/1226100.png?w=996',
        'dataDeInicio': '20/11/2021',
        'licoes': [
          {
            'id': '1',
            'titulo': 'Vogais',
            'corpo': 'Treine as vogais',
            'atividades': [
              {
                'id': '1',
                'titulo': 'Vogal A',
                'corpo': 'Hora de treinar a vogal A',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '10'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '11'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '20'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '4'
                  },
                ],
              },
              {
                'id': '2',
                'titulo': 'Vogal E',
                'corpo': 'Hora de treinar a vogal E',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '9'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '13'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '5'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '7'
                  },
                ],
              },
              {
                'id': '3',
                'titulo': 'Vogal I',
                'corpo': 'Hora de treinar a vogal I',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '63.0',
                    'quantidadeGravacoes': '16'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '100.0',
                    'quantidadeGravacoes': '3'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '71.0',
                    'quantidadeGravacoes': '4'
                  },
                ],
              },
            ],
          },
          {
            'id': '2',
            'titulo': 'Sílabas com B',
            'corpo': 'Treine as vogais acompanhadas da consoante B',
            'atividades': [
              {
                'id': '1',
                'titulo': 'Sílaba BA',
                'corpo': 'Hora de treinar a sílaba BA',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '1'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '5'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '14'
                  },
                ],
              },
              {
                'id': '2',
                'titulo': 'sílaba BE',
                'corpo': 'Hora de treinar a sílaba BE',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '45.0',
                    'quantidadeGravacoes': '7'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '52.0',
                    'quantidadeGravacoes': '11'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '1'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '51.0',
                    'quantidadeGravacoes': '2'
                  },
                ],
              },
              {
                'id': '3',
                'titulo': 'sílaba BI',
                'corpo': 'Hora de treinar a sílaba BI',
                'feita': true,
                'tentativas': [
                  {
                    'id': '1',
                    'data': '20/07/2021',
                    'nota': '63.0',
                    'quantidadeGravacoes': '4'
                  },
                  {
                    'id': '2',
                    'data': '20/07/2021',
                    'nota': '100.0',
                    'quantidadeGravacoes': '2'
                  },
                  {
                    'id': '3',
                    'data': '20/07/2021',
                    'nota': '97.0',
                    'quantidadeGravacoes': '6'
                  },
                  {
                    'id': '4',
                    'data': '20/07/2021',
                    'nota': '71.0',
                    'quantidadeGravacoes': '9'
                  },
                ],
              },
            ],
          },
        ]
      }
    ]
  });
}
