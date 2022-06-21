import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class SuccessNotification {
  void call({required String title, required String subtitle}) =>
      BotToast.showNotification(
          leading: (_) => Icon(
                Icons.done_all_rounded,
                color: AppColors.success,
              ),
          title: (_) => Text(title),
          subtitle: (_) => Text(subtitle));
}
