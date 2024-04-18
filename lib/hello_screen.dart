import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Test"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MESSAGE",
                key: ValueKey("my_key"),
              ),
              const Icon(
                Icons.table_bar_rounded,
                size: 200,
              ),
              TextButton(
                onPressed: () {},
                child: const Text("MY BUTTON 1"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("MY BUTTON 2"),
              ),
              const SizedBox(),
              const TextField()
            ],
          ),
        ),
      ),
    );
  }
}
