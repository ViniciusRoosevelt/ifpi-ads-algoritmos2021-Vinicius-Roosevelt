import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class WarningNotification {
  void call({required String title, required String subtitle}) =>
      BotToast.showNotification(
          leading: (_) => Icon(
                Icons.warning_rounded,
                color: AppColors.warning,
              ),
          title: (_) => Text(title),
          subtitle: (_) => Text(subtitle));
}
