import 'package:tinkercad/features/common/model/task_model.dart';

class HomeState {
  HomeState({
    this.tasks = const [],
    this.error,
    this.isLoading = false,
    this.allTasksComplete = false,
  });

  final List<TaskModel> tasks;
  final Object? error;
  final bool isLoading;
  final bool allTasksComplete;
}
