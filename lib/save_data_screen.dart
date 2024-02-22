import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataScreen extends StatefulWidget {
  const SaveDataScreen({super.key});

  @override
  State<SaveDataScreen> createState() => _SaveDataScreenState();
}

class _SaveDataScreenState extends State<SaveDataScreen> {
  int counter = 0;

  SharedPreferences? _pref;

  Future<void> _getSharedInstance() async {
    _pref = await SharedPreferences.getInstance();
    if (_pref != null) {
      counter = _pref!.getInt("counter") ?? 0;
      setState(() {});
    }
  }

  @override
  void initState() {
    _getSharedInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Save Data Locally"),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: AppTextStyle.interSemiBold.copyWith(
            fontSize: 42,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          if (_pref != null) {
            _pref!.setInt("counter", counter);
          }

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
