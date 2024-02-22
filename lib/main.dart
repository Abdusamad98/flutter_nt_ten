import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/save_data_screen.dart';
import 'package:flutter_nt_ten/saving_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  StorageRepository.instance;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SavingScreen(),
    ),
  );
}
