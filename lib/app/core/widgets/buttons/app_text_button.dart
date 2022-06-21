import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isExpanded;
  final Function? onLongPress;
  final String? text;
  final IconData? leftIcon;
  final Color? color;

  const AppTextButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color,
      this.onLongPress,
      this.leftIcon,
      this.isExpanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _currentColor = color ?? Theme.of(context).primaryColor;
    final enabled = onPressed != null;
    return GestureDetector(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: enabled ? _currentColor : _currentColor.withOpacity(0.4),
        ),
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null) Icon(leftIcon),
            if (leftIcon != null) SizedBox(width: 12.0),
            Text(
              text ?? 'Não informado',
              maxLines: null,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
