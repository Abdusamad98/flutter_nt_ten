import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/screens/home/home_screen.dart';
import 'package:flutter_nt_ten/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  await fillDBIfEmpty();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}
