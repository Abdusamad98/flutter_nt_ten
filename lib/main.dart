import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/screens/routes.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.c121212,
      ),
    );
  }
}
