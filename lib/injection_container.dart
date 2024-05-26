import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scelloo_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:scelloo_test/features/home/domain/repositories/home_repository.dart';
import 'package:scelloo_test/features/home/domain/usecases/create_post.dart';
import 'package:scelloo_test/features/home/domain/usecases/get_posts.dart';

import 'core/network/api_client.dart';
import 'core/network/dio_client.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/usecases/delete_post.dart';
import 'features/home/domain/usecases/update_post.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //Navigator key
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());

  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  //Api Client
  getIt.registerLazySingleton<ApiClient>(() => getIt<DioClient>());

  //HomeDataSource
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt<ApiClient>()));

  //HomeRepository
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()));

  //HomeBloc
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc());

  //UseCases ----------------------------------------------
  getIt
      .registerLazySingleton<GetPosts>(() => GetPosts(getIt<HomeRepository>()));
  getIt.registerLazySingleton<CreatePost>(
      () => CreatePost(getIt<HomeRepository>()));
  getIt.registerLazySingleton<UpdatePost>(
      () => UpdatePost(getIt<HomeRepository>()));
  getIt.registerLazySingleton<DeletePost>(
      () => DeletePost(getIt<HomeRepository>()));

  
}
