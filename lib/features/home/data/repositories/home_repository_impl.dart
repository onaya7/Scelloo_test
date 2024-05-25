import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/post_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> fetchPosts() async {
    final posts = await remoteDataSource.fetchPosts();
    return posts.map((post) => Post.fromJson(post)).toList();
  }

  @override
  Future<Post> fetchPostDetails(int id) async {
    final post = await remoteDataSource.fetchPostDetails(id);
    return Post.fromJson(post);
  }

  @override
  Future<Post> createPost(Map<String, dynamic> data) async {
    final post = await remoteDataSource.createPost(data);
    return Post.fromJson(post);
  }

  @override
  Future<Post> updatePost(int id, Map<String, dynamic> data) async {
    final post = await remoteDataSource.updatePost(id, data);
    return Post.fromJson(post);
  }

  @override
  Future<Post> deletePost(int id) async {
    final post = await remoteDataSource.deletePost(id);
    return Post.fromJson(post);
  }
}
