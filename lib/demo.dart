
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple To-Do model
class Todo {
  String task;
  bool done;
  Todo({required this.task, this.done = false});
}

// StateNotifier for the To-Do list
class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  void addTask(String task) {
    if (task.isEmpty) return;
    state = [...state, Todo(task: task)];
  }

  void toggleDone(int index) {
    state[index].done = !state[index].done;
    state = [...state];
  }

  void removeTask(int index) {
    state.removeAt(index);
    state = [...state];
  }
}

// Riverpod provider for To-Do list
final todoProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList());

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  final TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      labelText: 'New Task',
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier).addTask(taskController.text);
                    taskController.clear();
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: todos.isEmpty
                  ? const Center(child: Text('No tasks yet!'))
                  : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.done,
                      onChanged: (_) {
                        ref.read(todoProvider.notifier).toggleDone(index);
                      },
                    ),
                    title: Text(
                      todo.task,
                      style: TextStyle(
                        decoration:
                        todo.done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(todoProvider.notifier).removeTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
