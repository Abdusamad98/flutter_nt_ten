import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/splash/splash_screen.dart';
import 'package:flutter_nt_ten/view_models/addressess_view_model.dart';
import 'package:flutter_nt_ten/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MapsViewModel()),
      ChangeNotifierProvider(create: (_) => AddressesViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SplashScreen(),
    );
  }
}
