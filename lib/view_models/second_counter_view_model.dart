import 'package:flutter/cupertino.dart';

class SecondCounterViewModel extends ChangeNotifier {
  SecondCounterViewModel() {
    increment();
  }

  int second = 0;

  increment() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      second++;
      notifyListeners();
    }
  }
}
