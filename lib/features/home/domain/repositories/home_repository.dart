import 'package:scelloo_test/features/home/data/models/post_model.dart';

abstract class HomeRepository {
  Future<List<Post>> fetchPosts();
  Future<Post> fetchPostDetails(int id);
  Future<Post> createPost(Map<String, dynamic> data);
  Future<Post> updatePost(int id, Map<String, dynamic> data);
  Future<Post> deletePost(int id);
}

