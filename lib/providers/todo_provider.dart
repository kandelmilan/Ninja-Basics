import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoList extends StateNotifier<List<Todo>> {
  TodoList() : super([]);

  void addtask(String task) {
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

  void editTask(int index, String newTask) {
    if (newTask.trim().isEmpty) return;
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Todo(task: newTask, done: state[i].done)
        else
          state[i],
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList());
