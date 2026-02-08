import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

void showEditDialog(BuildContext context,int  index, String oldTask) {
  final editController = TextEditingController(text: oldTask);
  showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          return AlertDialog(
            title: const Text('Edit Task'),
            content: TextField(controller: editController),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).editTask(index, editController.text);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    },
  );
}