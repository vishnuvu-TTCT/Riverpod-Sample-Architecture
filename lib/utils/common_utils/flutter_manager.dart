import 'package:flutter/material.dart';

class FlutterManager {
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  //TODO:Add Another Common [Functions] here
}
