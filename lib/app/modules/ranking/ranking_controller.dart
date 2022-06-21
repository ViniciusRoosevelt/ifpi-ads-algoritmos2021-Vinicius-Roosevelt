import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import './ranking_repository.dart';

class RankingController {
  final RankingRepository repository;
  var bottomNavIndex = RxNotifier<int>(0);
  var pageController = PageController();

  RankingController({required this.repository});
}
