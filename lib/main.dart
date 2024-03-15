import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/data/repositories/book_repo.dart';
import 'package:flutter_nt_ten/screens/library/library_screen.dart';
import 'package:flutter_nt_ten/utils/theme/app_theme.dart';
import 'package:flutter_nt_ten/view_models/book_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => BookViewModel(productRepo: BookRepo()))
    ],
    child: MyApp(),
  ));
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
          home: LibraryScreen(),
        );
      },
    );
  }
}
