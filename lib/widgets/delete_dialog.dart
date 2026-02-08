import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

void showDeleteDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          return AlertDialog(
            title: const Text('Delete Task'),
            content: const Text('Are you sure you want to delete this task?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).removeTask(index);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    },
  );
}
