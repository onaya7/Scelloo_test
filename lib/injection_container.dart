import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';

final getIt = GetIt.instance;

void init() {
  // DioClient
  getIt.registerLazySingleton<DioClient>(() => DioClient.instance);

  //Navigator key
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
}
