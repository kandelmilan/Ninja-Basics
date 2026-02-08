import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/pages/login.dart';
import '../providers/todo_provider.dart';
import '../providers/post_provider.dart';
import '../widgets/delete_dialog.dart';
import '../widgets/edit_dialog.dart';
import 'post_page.dart';
import 'CreatePostPage.dart';

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
    final postsAsync = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do & API Posts')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Login button
            Padding(
              padding: const EdgeInsets.only(left: 316),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('Login'),
              ),
            ),

            const SizedBox(height: 10),

            // To-Do input row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(labelText: 'Task'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      ref.read(todoProvider.notifier)
                          .addtask(taskController.text);
                      taskController.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Scrollable area for To-Do list and API posts
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // To-Do List
                    const Text(
                      'To-Do List',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return ListTile(
                          leading: Checkbox(
                            value: todo.done,
                            onChanged: (_) {
                              ref
                                  .read(todoProvider.notifier)
                                  .toggleDone(index);
                            },
                          ),
                          title: Text(todo.task),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => showEditDialog(
                                    context, index, todo.task),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    showDeleteDialog(context, index),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const Divider(),

                    // API Posts
                    const Text(
                      'API Posts',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    postsAsync.when(
                      data: (posts) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              title: Text(post.title),
                              subtitle: Text(
                                post.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                      loading: () =>
                      const Center(child: CircularProgressIndicator()),
                      error: (e, _) => Center(child: Text(e.toString())),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Buttons for Post pages
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PostPage()),
                    );
                  },
                  child: const Text('Get Post by ID'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreatePostPage()),
                    );
                  },
                  child: const Text('Post data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
