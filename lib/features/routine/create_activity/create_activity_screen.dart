import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinkercad/features/routine/create_activity/create_activity_controller.dart';

class CreateActivityPage extends HookConsumerWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final controller = ref.read(createActivityControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create activity'),
      ),
      body: Padding(
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
              onPressed: () {
                Navigator.of(context).pop();

                controller.onSaveClicked(
                  context,
                  name: nameController.text,
                  description: descriptionController.text,
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
