import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String titleBtn;
  final VoidCallback onTap;
  const ButtonDefault({Key? key, required this.onTap, required this.titleBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 160,
      child: ElevatedButton(
        child: Text(titleBtn),
        onPressed: onTap,
      ),
    );
  }
}
