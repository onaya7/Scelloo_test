import 'package:dio/dio.dart';
import 'package:scelloo_test/core/instance/logger.dart';
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
  Future<List<dynamic>> fetchPosts() async {
    Response response = await apiClient.get(ApiConstants.post);
    if (response.statusCode == 200) {
      return List<dynamic>.from(response.data);
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Map<String, dynamic>> fetchPostDetails(int id) async {
    Response response = await apiClient.get(ApiConstants.getPost(id: id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load post details');
    }
  }

  @override
  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    Response response = await apiClient.post(
      ApiConstants.post,
      data: data,
    );
    if (response.statusCode == 201) {
      logger.i('response: ${response.data}');
      return response.data;
    } else {
      throw Exception('Failed to create post');
    }
  }

  @override
  Future<Map<String, dynamic>> updatePost(
      int id, Map<String, dynamic> data) async {
    Response response = await apiClient.put(
      ApiConstants.getPost(id: id),
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to update post');
    }
  }

  @override
  Future<Map<String, dynamic>> deletePost(int id) async {
    Response response = await apiClient.delete(ApiConstants.getPost(id: id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to delete post');
    }
  }
}
