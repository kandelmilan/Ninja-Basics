//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // Simple To-Do model
// class Todo {
//   String task;
//   bool done;
//   Todo({required this.task, this.done = false});
// }
//
// // StateNotifier for the To-Do list
// class TodoList extends StateNotifier<List<Todo>> {
//   TodoList() : super([]);
//
//   void addTask(String task) {
//     if (task.isEmpty) return;
//     state = [...state, Todo(task: task)];
//   }
//
//   void toggleDone(int index) {
//     state[index].done = !state[index].done;
//     state = [...state];
//   }
//
//   void removeTask(int index) {
//     state.removeAt(index);
//     state = [...state];
//   }
// }
//
// // Riverpod provider for To-Do list
// final todoProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList());
//
// class LandingPage extends ConsumerStatefulWidget {
//   const LandingPage({super.key});
//
//   @override
//   ConsumerState<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends ConsumerState<LandingPage> {
//   final TextEditingController taskController = TextEditingController();
//
//   @override
//   void dispose() {
//     taskController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final todos = ref.watch(todoProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do List'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: taskController,
//                     decoration: const InputDecoration(
//                       labelText: 'New Task',
//                       hintText: 'Enter a task',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(todoProvider.notifier).addTask(taskController.text);
//                     taskController.clear();
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: todos.isEmpty
//                   ? const Center(child: Text('No tasks yet!'))
//                   : ListView.builder(
//                 itemCount: todos.length,
//                 itemBuilder: (context, index) {
//                   final todo = todos[index];
//                   return ListTile(
//                     leading: Checkbox(
//                       value: todo.done,
//                       onChanged: (_) {
//                         ref.read(todoProvider.notifier).toggleDone(index);
//                       },
//                     ),
//                     title: Text(
//                       todo.task,
//                       style: TextStyle(
//                         decoration:
//                         todo.done ? TextDecoration.lineThrough : null,
//                       ),
//                     ),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         ref.read(todoProvider.notifier).removeTask(index);
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// // API DATA :-
//
// // const Divider(),
// // // API Posts
// // const Text(
// //   'API Posts',
// //   style:
// //   TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // ),
// // postsAsync.when(
// //   data: (posts) => ListView.builder(
// //     physics: const NeverScrollableScrollPhysics(),
// //     shrinkWrap: true,
// //     itemCount: posts.length,
// //     itemBuilder: (context, index) {
// //       final post = posts[index];
// //       return Card(
// //         margin: const EdgeInsets.symmetric(vertical: 4),
// //         child: ListTile(
// //           title: Text(post.title),
// //           subtitle: Text(
// //             post.body,
// //             maxLines: 2,
// //             overflow: TextOverflow.ellipsis,
// //           ),
// //         ),
// //       );
// //     },
// //   ),
// //   loading: () =>
// //   const Center(child: CircularProgressIndicator()),
// //   error: (e, _) => Center(child: Text(e.toString())),
// // ),


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _collegeHeader(),
            _greetingCard(),
            _academicsSection(),
            _todayClasses(),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // // ---------------- BOTTOM NAV ----------------
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 2,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.campaign), label: 'Notice'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.calendar_today), label: 'Calendar'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.dashboard), label: 'Dashboard'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.payments), label: 'Fees'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),


    );
  }

  // ---------------- COLLEGE HEADER ----------------
  Widget _collegeHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.school, color: Colors.indigo),
          SizedBox(width: 8),
          Text(
            'Himalaya College of Engineering',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- GREETING CARD ----------------
  Widget _greetingCard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Good Evening,\nMilan Kandel',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _infoCard('Attendance', '0%'),
                const SizedBox(width: 12),
                _infoCard('Task Due', '2'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(title),
          ],
        ),
      ),
    );
  }

  // ---------------- ACADEMICS SECTION ----------------
  Widget _academicsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Academics'),
          const SizedBox(height: 12),
          Row(
            children: [
              _menuCard('Attendance\n(Subject)'),
              _menuCard('Attendance\n(Class)'),
              _menuCard('Assignment'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuCard(String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ],
          ),
          child: Column(
            children: [
              const Icon(Icons.calendar_month, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TODAY CLASSES ----------------
  Widget _todayClasses() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader("Today's Classes"),
            const SizedBox(height: 6),
            const Text(
              'No classes scheduled for today',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- SECTION HEADER ----------------
  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('View All →'),
        ),
      ],
    );
  }
}
