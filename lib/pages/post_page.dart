import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/providers/post_provider.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  final TextEditingController _controller = TextEditingController();
  int? postId;

  @override
  Widget build(BuildContext context) {
    final postAsync = postId == null
        ? null
        : ref.watch(singlePostProvider(postId!));

    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Post by ID')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Post ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final id = int.tryParse(_controller.text);
                if (id != null) {
                  setState(() {
                    postId = id;
                  });
                }
              },
              child: const Text('Fetch Post'),
            ),
            const SizedBox(height: 20),

            if (postAsync != null)
              Expanded(
                child: postAsync.when(
                  data: (post) => Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(post.body),
                        ],
                      ),
                    ),
                  ),
                  loading: () =>
                  const Center(child: CircularProgressIndicator()),
                  error: (e, _) =>
                      Center(child: Text(e.toString())),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
