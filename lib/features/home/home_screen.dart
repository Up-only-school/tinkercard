// MVP, MVC, MVVM
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinkercad/features/home/home_controller.dart';
import 'package:tinkercad/features/home/home_state.dart';
import 'package:tinkercad/features/home/internal/complete_view.dart';
import 'package:tinkercad/ui/activity_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m home'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {


          return Center(
            child: state.allTasksComplete ? const CompleteView() : ListView.builder(
              shrinkWrap: true,
              itemCount: state.activities.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: ActivityCard(
                  activity: state.activities[index],
                  onNegativePressed: () => bloc.onNegativePressed(state.activities[index]),
                  onPositivePressed: () => bloc.onPositivePressed(state.activities[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
