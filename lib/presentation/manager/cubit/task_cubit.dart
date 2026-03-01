import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notaadepi/core/servies/shared_prefs.dart';
import 'package:notaadepi/data/models/task_item_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  List<TaskModelItem> _allList = [];
  String searchQuery = '';
  List<TaskModelItem> get completedList {
    return _allList.where((e) => e.isCompleted).toList();
  }

  List<TaskModelItem> get notCompletedList {
    return _allList.where((e) => !e.isCompleted).toList();
  }

  List<TaskModelItem> get displayedList {
    if (searchQuery.isEmpty) {
      return _allList;
    } else {
      return _allList
          .where(
            (task) => task.title.toLowerCase().contains(
              searchQuery.toLowerCase().trim(),
            ),
          )
          .toList();
    }
  }

  void addNewTask(TaskModelItem item) {
    List<String> notes = SharedPrefs.getListOfString(key: 'notes');
    var jesonData = jsonEncode(item.toMap());
    notes.add(jesonData);
    SharedPrefs.setListOfString(key: 'notes', noteList: notes);
    _allList.add(item);
    emit(TaskAddSuccess());
  }

  void readNotes() {
    _allList.clear();
    List<String> readList = SharedPrefs.getListOfString(key: 'notes');
    for (String item in readList) {
      var noteItem = jsonDecode(item);
      _allList.add(TaskModelItem.fromjeson(noteItem));
    }
    emit(TaskReadState());
  }

  void toggleTask(TaskModelItem item) {
    item.isCompleted = !item.isCompleted;
    _saveAllTasks();
    emit(TaskChangeState());
  }

  void search(String value) {
    searchQuery = value;
    emit(TaskSearchState());
  }

  void _saveAllTasks() {
    List<String> encodedList = _allList
        .map((task) => jsonEncode(task.toMap()))
        .toList();
    SharedPrefs.setListOfString(key: 'notes', noteList: encodedList);
  }
}
