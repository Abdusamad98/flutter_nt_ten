import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/reading_screen.dart';
import 'package:flutter_nt_ten/utils/constants/storage_keys.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class SavingScreen extends StatefulWidget {
  const SavingScreen({super.key});

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAVING SCREEN"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(16)),
                onPressed: () {
                  StorageRepository.setInt(
                    key: StorageKeys.recordKey,
                    value: 100,
                  );
                },
                child: Text(
                  "Save Integer",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, padding: EdgeInsets.all(16)),
                onPressed: () {
                  StorageRepository.setString(key: "text", value: "Ali");
                },
                child: Text(
                  "Save String",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, padding: EdgeInsets.all(16)),
                onPressed: () {
                  StorageRepository.setBool(key: "my_boolean", value: true);
                },
                child: Text(
                  "Save Bool",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, padding: EdgeInsets.all(16)),
                onPressed: () {
                  StorageRepository.setDouble(key: "pi", value: 3.141567778);
                },
                child: Text(
                  "Save Double",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red, padding: EdgeInsets.all(16)),
                onPressed: () {
                  StorageRepository.setListString(
                    key: "my_list",
                    values: ["Ali", "Vali"],
                  );
                },
                child: Text(
                  "Save List String",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, padding: EdgeInsets.all(16)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ReadingScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "READ ALL DATA",
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
