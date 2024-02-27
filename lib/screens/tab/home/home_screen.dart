import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/task_model.dart';
import 'package:flutter_nt_ten/screens/tab/home/dialogs/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskModel taskModel = TaskModel.initialValue;

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    taskModel.canAddTaskToDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskDialog(
            context: context,
            taskModelChanged: (task) {
              task.toString();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
