import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nt_ten/app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
