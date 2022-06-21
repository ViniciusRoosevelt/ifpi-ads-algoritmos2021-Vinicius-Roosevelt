import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ErrorNotification {
  void call({required String title, required String subtitle}) =>
      BotToast.showNotification(
          leading: (_) => Icon(
                Icons.error_outline_rounded,
                color: AppColors.danger,
              ),
          title: (_) => Text(title),
          subtitle: (_) => Text(subtitle));
}
