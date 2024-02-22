import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/storage_repository.dart';
import 'package:flutter_nt_ten/utils/constants/storage_keys.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
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
                onPressed: null,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(16)),
                child: Text(
                  "Read Integer:${StorageRepository.getInt(key: StorageKeys.recordKey)}",
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
                onPressed: () {},
                child: Text(
                  "Read String:${StorageRepository.getString(key: "text")}",
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
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(16)),
                onPressed: () {},
                child: Text(
                  "Read Bool:${StorageRepository.getBool(key: "my_boolean")}",
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
                onPressed: () {},
                child: Text(
                  "Read Double:${StorageRepository.getDouble(key: "pi")}",
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
                onPressed: () {},
                child: Text(
                  "Read ListStrong:${StorageRepository.getStringList(key: "my_list")}",
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
