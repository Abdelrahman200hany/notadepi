class TaskModelItem {
  final String title, data;
  bool isCompleted;

  TaskModelItem({
    required this.title,
    required this.data,
    this.isCompleted = false,
  });

  toMap() {
    return {'title': title, 'data': data, 'isCompleted': isCompleted};
  }

  factory TaskModelItem.fromjeson(jeson) {
    return TaskModelItem(
      title: jeson['title'],
      data: jeson['data'],
      isCompleted: jeson['isCompleted'],
    );
  }
}
