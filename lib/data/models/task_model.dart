import 'package:flutter_nt_ten/data/models/task_status.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String category;
  final DateTime deadline;
  final int priority;
  final TaskStatus status;

  TaskModel({
    this.id,
    required this.description,
    required this.title,
    required this.status,
    required this.category,
    required this.deadline,
    required this.priority,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    DateTime? deadline,
    int? priority,
    TaskStatus? status,
  }) {
    return TaskModel(
      description: description ?? this.description,
      title: title ?? this.title,
      status: status ?? this.status,
      category: category ?? this.category,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      description: json["description"] as String? ?? "",
      title: json["title"] as String? ?? "",
      status: getStatus(json["status"] as String? ?? ""),
      category: json["category"] as String? ?? "",
      deadline: DateTime.parse(json["deadline"] as String? ?? ""),
      priority: json["priority"] as int? ?? 1,
      id: json["_id"] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
      "status": status.name,
      "category": category,
      "deadline": deadline.toString(),
      "priority": priority,
    };
  }

  bool canAddTaskToDatabase() {
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (category.isEmpty) return false;
    if (priority == 0) return false;
    return true;
  }

  static TaskModel initialValue = TaskModel(
    description: "",
    title: "",
    status: TaskStatus.processing,
    category: "",
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
