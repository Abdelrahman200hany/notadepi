import 'package:flutter/material.dart';
import 'package:notaadepi/data/models/task_item_model.dart';
import 'package:notaadepi/presentation/manager/task_item_provider.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.item});
  final TaskModelItem item;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskItemProvider>(context, listen: false);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: item.isCompleted,
        onChanged: (value) {
          provider.toggleTask(item);
        },
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: const Color(0xff737373),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          decoration: item.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        item.data,
        style: TextStyle(
          color: const Color(0xff737373),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          decoration: item.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    );
  }
}
