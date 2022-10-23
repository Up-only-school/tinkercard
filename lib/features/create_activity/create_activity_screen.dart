import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinkercad/features/create_activity/create_activity_controller.dart';
import 'package:tinkercad/features/create_activity/create_activity_state.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  final bloc = CreateActivityBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create activity'),
      ),
      body: BlocBuilder<CreateActivityBloc, CreateActivityState>(
        bloc: bloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Add image"),
                ),
                ElevatedButton(
                  onPressed: () => bloc.onSaveClicked(
                    context,
                    name: nameController.text,
                    description: descriptionController.text,
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
