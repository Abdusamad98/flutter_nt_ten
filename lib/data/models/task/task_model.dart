import 'package:flutter_nt_ten/data/models/task/task_model_constants.dart';
import 'package:flutter_nt_ten/data/models/task/task_status.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final int categoryId;
  final DateTime deadline;
  final int priority;
  final TaskStatus status;

  TaskModel({
    this.id,
    required this.description,
    required this.title,
    required this.status,
    required this.categoryId,
    required this.deadline,
    required this.priority,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    int? categoryId,
    DateTime? deadline,
    int? priority,
    TaskStatus? status,
  }) {
    return TaskModel(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
      categoryId: categoryId ?? this.categoryId,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json[TaskModelConstants.description] as String? ?? "",
      title: json[TaskModelConstants.title] as String? ?? "",
      status: getStatus(json[TaskModelConstants.status] as String? ?? ""),
      categoryId: json[TaskModelConstants.category] as int? ?? 0,
      deadline:
          DateTime.parse(json[TaskModelConstants.deadline] as String? ?? ""),
      priority: json[TaskModelConstants.priority] as int? ?? 1,
      id: json[TaskModelConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TaskModelConstants.description: description,
      TaskModelConstants.title: title,
      TaskModelConstants.status: status.name,
      TaskModelConstants.category: categoryId,
      TaskModelConstants.deadline: deadline.toString(),
      TaskModelConstants.priority: priority,
    };
  }

  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (categoryId == 0) return false;
    if (priority == 0) return false;
    return true;
  }

  static TaskModel initialValue = TaskModel(
    description: "",
    title: "",
    status: TaskStatus.processing,
    categoryId: 0,
    deadline: DateTime.now(),
    priority: 1,
  );
}

TaskStatus getStatus(String statusText) {
  switch (statusText) {
    case "processing":
      {
        return TaskStatus.processing;
      }
    case "done":
      {
        return TaskStatus.done;
      }
    case "canceled":
      {
        return TaskStatus.canceled;
      }
    default:
      {
        return TaskStatus.missed;
      }
  }
}
