import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      // TODO Step 1
      initialRoute: RouteNames.helloScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
