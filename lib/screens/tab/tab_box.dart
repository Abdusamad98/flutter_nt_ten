import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/screens/tab/calendar/calendar_screen.dart';
import 'package:flutter_nt_ten/screens/tab/home/dialogs/add_task_dialog.dart';
import 'package:flutter_nt_ten/screens/tab/home/home_screen.dart';
import 'package:flutter_nt_ten/screens/tab/profile/profile_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  StreamController<bool> streamController = StreamController<bool>();

  List<Widget> screens = [
    HomeScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  int activeIndex = 0;

  _init() async {
    screens = [
      HomeScreen(stream: streamController.stream.asBroadcastStream()),
      CalendarScreen(),
      ProfileScreen(),
    ];
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Jome",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskDialog(
            context: context,
            taskModelChanged: (task) async {
              await LocalDatabase.insertTask(task);
              streamController.add(true);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
