import 'package:bloc/bloc.dart';
import 'package:tinkercad/features/home/home_state.dart';
import 'package:tinkercad/services/api/api.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc()
      : super(HomeState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          activities: [],
        )){
    _loadActivities();
  }

  final api = Api();

  Future<void> _loadActivities() async {
    final activities = await api.loadActivities();
    emit(HomeState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      activities: activities,
    ));
  }

  void doSomething() {
    emit(HomeState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      activities: [],
    ));
  }
}
