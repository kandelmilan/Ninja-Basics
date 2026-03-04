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


//
//
// Widget _upComingEvents() {
//   return Padding(
//     padding: const EdgeInsets.only(left: 16, bottom: 20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(right: 16),
//           child: _sectionHeader("Upcoming Events"),
//         ),
//         const SizedBox(height: 12),
//
//         SizedBox(
//           height: 320,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               _eventCard(
//                 image: 'assets/event1.jpg',
//                 date: '10 Feb, 12:00 AM – 12:00 AM',
//                 title:
//                 'Building Construction III (TH) - Final Project Report Submission and Presentation 3rd Year 1st Part (BAR)',
//               ),
//               _eventCard(
//                 image: 'assets/event2.jpg',
//                 date: '10 Feb, 12:00 AM – 12:00 AM',
//                 title:
//                 'Thesis Presentation - Mid Term (BAR)',
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
//
// Widget _eventCard({
//   required String image,
//   required String date,
//   required String title,
// }) {
//   return Container(
//     width: 240,
//     margin: const EdgeInsets.only(right: 16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: const [
//         BoxShadow(color: Colors.black12, blurRadius: 6),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // -------- IMAGE --------
//         ClipRRect(
//           borderRadius: const BorderRadius.vertical(
//             top: Radius.circular(16),
//           ),
//           child: Image.asset(
//             image,
//             height: 140,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//
//         // -------- CONTENT --------
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 date,
//                 style: const TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 title,
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: const [
//                   Icon(Icons.location_on,
//                       size: 16, color: Colors.grey),
//                   SizedBox(width: 4),
//                   Text(
//                     'Himalaya College',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//         const Spacer(),
//
//         // -------- ACTIONS --------
//         Padding(
//           padding: const EdgeInsets.all(12),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.blue.shade100,
//                 child: const Icon(Icons.add, color: Colors.blue),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text('Interested'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }






// import 'package:flutter/material.dart';

// class MockTestScreen extends StatefulWidget {
//   const MockTestScreen({super.key});

//   @override
//   State<MockTestScreen> createState() => _MockTestScreenState();
// }

// class _MockTestScreenState extends State<MockTestScreen> {
//   int selectedTab = 0;

//   final tabs = ["Full Tests", "Sectional", "Custom"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF3F6FB),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xff8FADE8), Color(0xffD6E2F7)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             _header(),
//             const SizedBox(height: 15),
//             _tabBar(),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 children: const [
//                   TestCard(
//                     title: "Full Mock Test 01",
//                     difficulty: "Easy",
//                     difficultyColor: Colors.green,
//                     time: "60 mins",
//                     questions: "50 Questions",
//                     rating: "4.8",
//                   ),
//                   SizedBox(height: 20),
//                   TestCard(
//                     title: "Full Mock Test 02",
//                     difficulty: "Medium",
//                     difficultyColor: Colors.orange,
//                     time: "90 mins",
//                     questions: "75 Questions",
//                     rating: "4.6",
//                   ),
//                   SizedBox(height: 20),
//                   TestCard(
//                     title: "Full Mock Test 03",
//                     difficulty: "Hard",
//                     difficultyColor: Colors.red,
//                     time: "120 mins",
//                     questions: "100 Questions",
//                     rating: "4.9",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _header() {
//     return Container(
//       padding: const EdgeInsets.all(16),

//       child: Row(
//         children: [
//           const Expanded(
//             child: Text(
//               "Mock Tests",
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _tabBar() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16),
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         children: List.generate(
//           tabs.length,
//           (index) => Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedTab = index;
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: BoxDecoration(
//                   color: selectedTab == index
//                       ? const Color(0xff2F63D6)
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                   child: Text(
//                     tabs[index],
//                     style: TextStyle(
//                       color: selectedTab == index
//                           ? Colors.white
//                           : Colors.black54,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TestCard extends StatelessWidget {
//   final String title;
//   final String difficulty;
//   final Color difficultyColor;
//   final String time;
//   final String questions;
//   final String rating;

//   const TestCard({
//     super.key,
//     required this.title,
//     required this.difficulty,
//     required this.difficultyColor,
//     required this.time,
//     required this.questions,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const Icon(Icons.bookmark_border, color: Colors.grey),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: difficultyColor.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               difficulty,
//               style: TextStyle(
//                 color: difficultyColor,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             children: [
//               const Icon(Icons.access_time, size: 18, color: Colors.blue),
//               const SizedBox(width: 6),
//               Text(time),
//               const SizedBox(width: 20),
//               const Icon(Icons.description, size: 18, color: Colors.blue),
//               const SizedBox(width: 6),
//               Text(questions),
//               const SizedBox(width: 20),
//               const Icon(Icons.star, size: 18, color: Colors.amber),
//               const SizedBox(width: 6),
//               Text(rating),
//             ],
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xff2F63D6),
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Text("Start Test", style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
