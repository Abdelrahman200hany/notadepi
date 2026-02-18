import 'package:flutter/material.dart';
import 'package:notaadepi/data/models/task_item_model.dart';

class TaskItemProvider extends ChangeNotifier {
  List<TaskModelItem> allList = [];
  List<TaskModelItem> get completedList {
    return allList.where((e) => e.isCompleted).toList();
  }

  List<TaskModelItem> get notCompletedList {
    return allList.where((e) => !e.isCompleted).toList();
  }

  void addNewTask(TaskModelItem item) {
    allList.add(item);
    notifyListeners();
  }

  void toggleTask(TaskModelItem item) {
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }
}
