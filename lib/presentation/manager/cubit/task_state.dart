part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskAddSuccess extends TaskState {}

final class TaskChangeState extends TaskState {}
final class TaskSearchState extends TaskState {}
final class TaskReadState extends TaskState {}
