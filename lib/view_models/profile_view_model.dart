import 'package:flutter/foundation.dart';

class ProfileViewModel extends ChangeNotifier {
  String userName = "";



  updateName(String name){
    userName = name;
    notifyListeners();
  }
}
