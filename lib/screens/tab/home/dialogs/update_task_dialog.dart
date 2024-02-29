import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/task/task_model.dart';
import 'package:flutter_nt_ten/screens/tab/home/dialogs/category_select_dialog.dart';
import 'package:flutter_nt_ten/screens/tab/home/dialogs/priority_select_dialog.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:flutter_nt_ten/utils/utilities.dart';
import 'package:intl/intl.dart';

updateTaskDialog({
  required BuildContext context,
  required TaskModel task,
  required ValueChanged<TaskModel> taskModelChanged,
}) {
  TaskModel taskModel = task;

  final TextEditingController titleController =
      TextEditingController(text: taskModel.title);
  final TextEditingController descriptionController =
      TextEditingController(text: taskModel.description);

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  String category = "work";
  int priority = 1;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Title",
                  style: AppTextStyle.interSemiBold.copyWith(fontSize: 20),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  focusNode: focusNode1,
                  controller: titleController,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                  onChanged: (v) {
                    taskModel = taskModel.copyWith(title: v);
                  },
                  decoration:
                      const InputDecoration(contentPadding: EdgeInsets.all(24)),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  focusNode: focusNode2,
                  onChanged: (v) {
                    taskModel = taskModel.copyWith(description: v);
                  },
                  controller: descriptionController,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 24,
                  ),
                  decoration:
                      InputDecoration(contentPadding: EdgeInsets.all(24)),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        dateTime = await showDatePicker(
                          cancelText: "Cancel",
                          confirmText: "Select",
                          barrierDismissible: false,
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          currentDate: DateTime.now(),
                        );

                        if (dateTime != null) {
                          setState(() {
                            taskModel = taskModel.copyWith(deadline: dateTime);
                          });
                        }
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                    IconButton(
                      onPressed: () async {
                        timeOfDay = await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.input,
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (timeOfDay != null) {
                          DateTime d = taskModel.deadline;
                          d.copyWith(
                            hour: timeOfDay!.hour,
                            minute: timeOfDay!.minute,
                          );
                          setState(() {
                            taskModel = taskModel.copyWith(deadline: d);
                          });
                        }
                      },
                      icon: const Icon(Icons.timer),
                    ),
                    IconButton(
                      onPressed: () async {
                        showCategorySelectDialog(
                          context: context,
                          categorySelection: (selectedCategory) {
                            setState(() {
                              category = selectedCategory;
                            });
                            taskModel =
                                taskModel.copyWith(category: selectedCategory);
                          },
                          category: category,
                        );
                      },
                      icon: const Icon(Icons.category),
                    ),
                    IconButton(
                      onPressed: () {
                        showPrioritySelectDialog(
                          p: taskModel.priority,
                          context: context,
                          priority: (p) {
                            setState(() {
                              priority = p;
                            });
                            taskModel = taskModel.copyWith(priority: p);
                            if (taskModel.canAddTaskToDatabase()) {
                              showSuccessMessage("SUCCESS");
                              taskModelChanged.call(taskModel);
                              Navigator.pop(context);
                            } else {
                              showErrorMessage("ERROR");
                            }
                          },
                        );
                      },
                      icon: const Icon(Icons.flag),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text("NEXT"),
                      ),
                    )
                  ],
                ),
                if (timeOfDay != null)
                  Row(
                    children: [
                      const Text("TIME: "),
                      Text("${timeOfDay!.hour}:${timeOfDay!.minute}"),
                    ],
                  ),
                if (dateTime != null)
                  Row(
                    children: [
                      const Text("DEADLINE: "),
                      Text(DateFormat.yMMMEd().format(dateTime!)),
                    ],
                  ),
                Row(
                  children: [
                    const Text("CATEGORY: "),
                    Text(category),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
