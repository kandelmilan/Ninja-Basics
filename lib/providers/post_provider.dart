import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/post_service.dart';
import '../models/post.dart';

final postServiceProvider = Provider<PostService>((ref) {
  return PostService();
});

//All posts
final postProvider = FutureProvider<List<Post>>((ref) {
  return ref.read(postServiceProvider).fetchPosts();
});

// Single post (IMPORTANT: family)
final singlePostProvider =
FutureProvider.family<Post, int>((ref, id) {
  return ref.read(postServiceProvider).fetchPostById(id);
});

final createPostProvider =
FutureProvider.family<Post, Map<String, dynamic>>((ref, data) {
  return ref.read(postServiceProvider).createPost(
    title: data['title'],
    body: data['body'],
    userId: data['userId'],
  );
});


