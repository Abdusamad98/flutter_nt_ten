import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/bloc/file_manager_bloc.dart';
import 'package:flutter_nt_ten/data/repositories/file_repository.dart';
import 'package:flutter_nt_ten/file_manager_screen.dart';
import 'package:flutter_nt_ten/services/file_maneger_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FileManagerService();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FileRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: FileManagerScreen(),
      ),
    );
  }
}
