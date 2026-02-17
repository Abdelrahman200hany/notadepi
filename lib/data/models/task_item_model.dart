class TaskModelItem {
  final String title, data;
   bool isCompleted;

  TaskModelItem({
    required this.title,
    required this.data,
    this.isCompleted = false,
  });
}
