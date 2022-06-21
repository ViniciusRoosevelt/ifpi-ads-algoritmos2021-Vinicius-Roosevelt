import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:rx_notifier/rx_notifier.dart';

import '../../../../../../core/enums/request_state.dart';
import '../../../../core/models/doctor.dart';
import 'create_lesson_repository.dart';

class CreateLessonController {
  final CreateLessonRepository repository;

  CreateLessonController({required this.repository});
  var requestState = RxNotifier<RequestState>(RequestState.IDLE);
  RxNotifier<bool> _saveEnabled = RxNotifier<bool>(false);

  bool get saveEnabled => _saveEnabled.value;
  set saveEnabled(bool value) => _saveEnabled.value = value;

  RxList<Map<String, dynamic>> _activityList = RxList<Map<String, dynamic>>([
    {'titulo': '', 'corpo': '', 'video': ''}
  ]);

  RxList<Map<String, dynamic>> get activityList => _activityList;
  set activityList(List<Map<String, dynamic>> value) =>
      _activityList = RxList.of(value);

  RxNotifier<int> _lessonActivityCount = RxNotifier<int>(1);

  int get lessonActivityCount => _lessonActivityCount.value;
  set lessonActivityCount(int value) => _lessonActivityCount.value = value;

  RxNotifier<String> _lessonTitle = RxNotifier<String>('');

  String get lessonTitle => _lessonTitle.value;
  set lessonTitle(String value) => _lessonTitle.value = value;

  RxNotifier<String> _lessonLevel = RxNotifier<String>('0');

  String get lessonLevel => _lessonLevel.value;
  set lessonLevel(String value) => _lessonLevel.value = value;

  RxNotifier<String> _lessonBody = RxNotifier<String>('');

  String get lessonBody => _lessonBody.value;
  set lessonBody(String value) => _lessonBody.value = value;

  void incrementActivityCount() {
    lessonActivityCount++;
  }

  void decrementActivityCount() {
    lessonActivityCount--;
  }

  bool lessonTitleIsValid() => lessonTitle.isNotEmpty;
  bool lessonBodyIsValid() => lessonBody.isNotEmpty;
  bool lessonLevelIsValid() =>
      lessonLevel.isNotEmpty && int.parse(lessonLevel) >= 0;
  bool activitiesAreValid() {
    RxNotifier<bool> _isValid = RxNotifier<bool>(false);
    activityList.forEach((activity) {
      if (activity.keys.isNotEmpty &&
          activity['titulo'].isNotEmpty &&
          activity['corpo'].isNotEmpty &&
          activity['video'].isNotEmpty) {
        _isValid.value = true;
      } else {
        _isValid.value = false;
      }
    });
    return _isValid.value;
  }

  void enableButton() {
    if (lessonTitleIsValid() &&
        lessonBodyIsValid() &&
        lessonLevelIsValid() &&
        activitiesAreValid()) {
      saveEnabled = true;
    } else {
      saveEnabled = false;
    }
  }

  void createLessonJson() {
    requestState.value = RequestState.LOADING;
    Map<String, dynamic> json = {
      'titulo': lessonTitle,
      'corpo': lessonBody,
      'nivel': lessonLevel,
      'atividades': activityList.toList()
    };

    repository.createLesson(json);
    requestState.value = RequestState.SUCCESS;
  }
}
