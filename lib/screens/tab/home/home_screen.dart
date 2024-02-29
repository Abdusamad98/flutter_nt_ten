import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/data/models/task/task_model.dart';
import 'package:flutter_nt_ten/screens/tab/home/dialogs/update_task_dialog.dart';
import 'package:flutter_nt_ten/screens/tab/home/widgets/task_item_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.stream,
  });

  final Stream? stream;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskModel taskModel = TaskModel.initialValue;

  List<TaskModel> tasks = [];

  _init() async {
    tasks = await LocalDatabase.getAllTasks();
    setState(() {});
  }

  _searchQuery(String q) async {
    tasks = await LocalDatabase.searchTasks(q);
    setState(() {});
  }

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
    _init();
    if (widget.stream != null) {
      widget.stream!.listen((event) {
        _init();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("TODOS"),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () {
          _init();
          return Future<void>.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            TextField(
              onChanged: _searchQuery,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(16)),
            ),
            Expanded(
              child: ListView(
                children: List.generate(
                  tasks.length,
                  (index) {
                    TaskModel taskModel = tasks[index];
                    return TaskItemView(
                      onStatusUpdate: () async {
                        await LocalDatabase.updateTaskStatus(
                          newStatus: "done",
                          taskId: taskModel.id!,
                        );
                        _init();
                      },
                      taskModel: taskModel,
                      onDelete: () async {
                        int d = await LocalDatabase.deleteTask(taskModel.id!);
                        print("DELETED ID:$d");
                        _init();
                      },
                      onUpdate: () {
                        updateTaskDialog(
                          context: context,
                          task: taskModel,
                          taskModelChanged: (updatedTask) async {
                            await LocalDatabase.updateTask(
                              updatedTask.copyWith(id: taskModel.id),
                              taskModel.id!,
                            );
                            _init();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
