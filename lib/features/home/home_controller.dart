import 'package:bloc/bloc.dart';
import 'package:tinkercad/features/home/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc()
      : super(HomeState(
          allTasksComplete: false,
          error: null,
          isLoading: true,
          tasks: [],
        )){
    _loadCards();
  }


  void _loadCards() {

  }

  void doSomething() {
    emit(HomeState(
      allTasksComplete: false,
      error: null,
      isLoading: false,
      tasks: [],
    ));
  }
}
