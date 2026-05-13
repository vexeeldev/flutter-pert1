import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  double _result = 0;

  double get result => _result;

  void convertCtoF(double celsius) {
    _result = (celsius * 9 / 5) + 32;
    notifyListeners();
  }

  void convertFtoC(double fahrenheit) {
    _result = (fahrenheit - 32) * 5 / 9;
    notifyListeners();
  }

  void reset() {
    _result = 0;
    notifyListeners();
  }
}