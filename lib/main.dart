import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/data/repositories/book_repo.dart';
import 'package:flutter_nt_ten/screens/library/library_screen.dart';
import 'package:flutter_nt_ten/screens/profile/profile_detail_screen.dart';
import 'package:flutter_nt_ten/utils/theme/app_theme.dart';
import 'package:flutter_nt_ten/view_models/book_view_model.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  var user = User()..printCurrentName();

  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => BookViewModel(productRepo: BookRepo())),
        // ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.light,
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

class User {
  String name = "";
  int age = 0;

  printCurrentName() {
    print("CURRENT NAME:$name");
  }
}
