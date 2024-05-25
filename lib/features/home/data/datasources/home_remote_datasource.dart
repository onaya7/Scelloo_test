import '../../../../core/network/api_client.dart';

abstract class HomeRemoteDataSource {
  Future<List<dynamic>> fetchPosts();
  Future<Map<String, dynamic>> fetchPostDetails(int id);
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data);
  Future<Map<String, dynamic>> updatePost(int id, Map<String, dynamic> data);
  Future<Map<String, dynamic>> deletePost(int id);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<dynamic>> fetchPosts() async {
    return await apiClient.get('posts');
  }

  @override
  Future<Map<String, dynamic>> fetchPostDetails(int id) async {
    return await apiClient.get('posts/$id');
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    return await apiClient.post(
      'posts',
      data: data,
    );
  }

  @override
  Future<Map<String, dynamic>> updatePost(
      int id, Map<String, dynamic> data) async {
    return await apiClient.put(
      'posts/$id',
      data: data,
    );
  }

  @override
  Future<Map<String, dynamic>> deletePost(int id) async {
    return await apiClient.delete('posts/$id');
  }
}
