import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier {
  int _counter = 1000;

  void increment() {
    _counter++;
    notifyListeners();
    debugPrint("COUNTER CURRENT VALUE:$_counter");
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  int get getCounter => _counter;
}
