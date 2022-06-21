import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AppFunctions {
  static Future<File> _getFile(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$filename.json");
  }

  static Future<void> saveInFile(
      String filename, Map<String, String?> data) async {
    final file = await _getFile(filename);
    await file.writeAsString(json.encode(data));
  }

  static Future<Map<String, dynamic>> readFromFile(String filename) async {
    try {
      final file = await _getFile(filename);
      if (await file.exists()) return json.decode(await file.readAsString());
    } catch (e) {
      print(e);
    }

    return {};
  }

  static Future<void> deleteFile(String filename) async {
    try {
      final file = await _getFile(filename);
      if (await file.exists()) await file.delete();
    } catch (e) {
      print(e);
    }
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
