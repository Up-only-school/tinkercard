// MVP, MVC, MVVM
//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinkercad/features/routine/internal/complete_view.dart';
import 'package:tinkercad/features/routine/routine_controller.dart';
import 'package:tinkercad/ui/activity_card.dart';

class RoutineScreen extends ConsumerWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloc = ref.read(routineControllerProvider.notifier);
    final state = ref.watch(routineControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m home'),
        actions: [
          IconButton(
            onPressed: () => bloc.onAddActivityClicked(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: state.allTasksComplete
          ? const Center(
              child: CompleteView(),
            )
          : ListView.builder(
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
  }
}
