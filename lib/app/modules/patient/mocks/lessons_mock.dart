import '../../../core/models/new_lesson.dart';

const Map<String, dynamic> jsonL1 = {
  "titulo": "Vogais",
  "nivel": "1",
  "bloqueada": false,
  "corpo": "Treine as Vogais",
  "atividades": [
    {"corpo": "Hora de treinar a vogal A", "titulo": "Vogal A"},
    {"corpo": "Hora de treinar a vogal É", "titulo": "Vogal É"},
    {"corpo": "Hora de treinar a vogal Ê", "titulo": "Vogal Ê"}
  ]
};

const Map<String, dynamic> jsonL2 = {
  "titulo": "Vogais 2",
  "bloqueada": false,
  "nivel": "2",
  "corpo": "Treine as Vogais 2",
  "atividades": [
    {"corpo": "Hora de treinar a vogal I", "titulo": "Vogal I"},
    {"corpo": "Hora de treinar a vogal O", "titulo": "Vogal O"},
    {"corpo": "Hora de treinar a vogal U", "titulo": "Vogal U"}
  ]
};

NewLesson licao01 = NewLesson.fromJson(jsonL1);
NewLesson licao02 = NewLesson.fromJson(jsonL2);

List<NewLesson> lessonsMock = [licao01, licao02];
