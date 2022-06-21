import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors.dart';
import '../../styles/typography.dart';

import 'package:flutter/material.dart';

class AppFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isExpanded;
  final Function? onLongPress;
  final String? text;
  final IconData? leftIcon;
  final Color? color;

  const AppFlatButton(
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
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 24),
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        color: _currentColor,
        disabledColor: _currentColor.withOpacity(0.4),
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(64),
        ),
        onPressed: enabled ? onPressed : null,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 128),
          child: Row(
            mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leftIcon != null) Icon(leftIcon),
              if (leftIcon != null) SizedBox(width: 12.0),
              Text(
                text?.toUpperCase() ?? 'Não informado',
                maxLines: null,
                softWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
