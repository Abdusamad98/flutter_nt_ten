import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/bloc/file_manager_bloc.dart';
import 'package:flutter_nt_ten/data/repositories/file_repository.dart';
import 'package:flutter_nt_ten/screens/download_example/home_page.dart';
import 'package:flutter_nt_ten/screens/file_manager/file_manager_screen.dart';
import 'package:flutter_nt_ten/services/file_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  // BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  await FileManagerService.init();

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
