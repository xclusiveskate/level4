import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  increaseCounter() {
    _counter++;
    notifyListeners();
  }
}
