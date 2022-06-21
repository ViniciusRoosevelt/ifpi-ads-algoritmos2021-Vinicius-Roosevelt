import 'package:apprax/app/core/models/activity_attempts.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ActivityReportController {
  ActivityReportController();

  List<double> getGradeList(List<ActivityAttempts> attempts) {
    var gradeList = [];
    attempts.forEach((i) => gradeList.add(double.parse(i.nota.value)));
    return gradeList.cast<double>();
  }
}
