import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notaadepi/data/models/task_item_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  final List<TaskModelItem> _allList = [];
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
            (task) =>
                task.title.toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }
  }

  void addNewTask(TaskModelItem item) {
    _allList.add(item);
    emit(TaskAddSuccess());
  }

  void toggleTask(TaskModelItem item) {
    item.isCompleted = !item.isCompleted;
    emit(TaskChangeState());
  }

  void search(String value) {
    searchQuery = value;
    emit(TaskSearchState());
  }
}
