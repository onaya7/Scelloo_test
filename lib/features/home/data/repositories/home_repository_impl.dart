import 'package:dio/dio.dart';
import 'package:scelloo_test/core/instance/logger.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';
import '../models/post_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> fetchPosts() async {
    List<Post> post = [];
    try {
      final response = await remoteDataSource.fetchPosts();
      post = response.map((post) => Post.fromJson(post)).toList();
      logger.d('post: $post');
      return post;
    } on DioException catch (e) {
      var error = AppException.fromDioError(e);
      logger.e('error: ${error.errorMessage}');
      throw error.errorMessage;
    }
  }

  @override
  Future<Post> fetchPostDetails(int id) async {
    Post post;
    try {
      final response = await remoteDataSource.fetchPostDetails(id);
      post = Post.fromJson(response);
      logger.d('post: $post');
      return post;
    } on DioException catch (e) {
      var error = AppException.fromDioError(e);
      logger.e('error: ${error.errorMessage}');
      throw error.errorMessage;
    }
  }

  @override
  Future<Post> createPost(Map<String, dynamic> data) async {
    Post post;
    try {
      final response = await remoteDataSource.createPost(data);
      post = Post.fromJson(response);
      logger.d('post: $post');
      return post;
    } on DioException catch (e) {
      var error = AppException.fromDioError(e);
      logger.e('error: ${error.errorMessage}');
      throw error.errorMessage;
    }
  }

  @override
  Future<Post> updatePost(int id, Map<String, dynamic> data) async {
    Post post;
    try {
      final response = await remoteDataSource.updatePost(id, data);
      post = Post.fromJson(response);
      logger.d('post: $post');
      return post;
    } on DioException catch (e) {
      var error = AppException.fromDioError(e);
      logger.e('error: ${error.errorMessage}');
      throw error.errorMessage;
    }
  }

  @override
  Future<Post> deletePost(int id) async {
    Post post;
    try {
      final response = await remoteDataSource.deletePost(id);
      post = Post.fromJson(response);
      logger.d('post: $post');
      return post;
    } on DioException catch (e) {
      var error = AppException.fromDioError(e);
      logger.e('error: ${error.errorMessage}');
      throw error.errorMessage;
    }
  }
}
