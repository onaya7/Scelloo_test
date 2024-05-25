import 'package:scelloo_test/utils/constants/api_constants.dart';

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
  // Future<List<dynamic>> fetchPosts() async {
  //   return await apiClient.get(ApiConstants.post);
  // }

  Future<List<dynamic>> fetchPosts() async {
    final response = await apiClient.get(ApiConstants.post);
    if (response.data is List) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchPostDetails(int id) async {
    return await apiClient.get(ApiConstants.getPost(id: id));
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    return await apiClient.post(
      ApiConstants.post,
      data: data,
    );
  }

  @override
  Future<Map<String, dynamic>> updatePost(
      int id, Map<String, dynamic> data) async {
    return await apiClient.put(
      ApiConstants.getPost(id: id),
      data: data,
    );
  }

  @override
  Future<Map<String, dynamic>> deletePost(int id) async {
    return await apiClient.delete(ApiConstants.getPost(id: id));
  }
}
