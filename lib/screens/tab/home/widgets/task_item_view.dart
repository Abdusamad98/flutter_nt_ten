import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/task_model.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';

class TaskItemView extends StatelessWidget {
  const TaskItemView({super.key, required this.taskModel, required this.onDelete, required this.onUpdate, required this.onStatusUpdate});

  final TaskModel taskModel;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final VoidCallback onStatusUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskModel.title,
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                taskModel.category,
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            taskModel.description,
            style: AppTextStyle.interSemiBold.copyWith(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskModel.category,
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                taskModel.priority.toString(),
                style: AppTextStyle.interSemiBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed:onUpdate,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              TextButton(
                onPressed: onStatusUpdate,
                child: Text(
                  taskModel.status.name,
                  style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
