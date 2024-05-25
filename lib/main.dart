import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scelloo_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:scelloo_test/injection_container.dart' as si;

import 'app.dart';
import 'injection_container.dart';

void main() async {
  si.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => getIt.call<HomeBloc>(),
            ),
          ],
          child: const MyApp(),
        );
      },
    ),
  );
}
