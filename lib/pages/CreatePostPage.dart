import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/post_provider.dart';
import '../models/post.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  Post? createdPost;

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final data = {
                  'title': titleController.text,
                  'body': bodyController.text,
                  'userId': 1,
                };

                try {
                  final post =
                  await ref.read(createPostProvider(data).future);

                  setState(() {
                    createdPost = post;
                  });

                  titleController.clear();
                  bodyController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Post created! ID = ${post.id}'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: const Text('Submit'),
            ),

            const SizedBox(height: 20),

            // SHOW CREATED POST
            if (createdPost != null)
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Generated ID: ${createdPost!.id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Title: ${createdPost!.title}'),
                      const SizedBox(height: 4),
                      Text('Body: ${createdPost!.body}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
