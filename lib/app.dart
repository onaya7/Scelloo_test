import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'core/device/routes/routes_generator.dart';
import 'core/device/routes/routes_manager.dart';
import 'core/device/themes/themes.dart';
import 'utils/helpers/helpers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: RoutesManager.postRoute,
      // initialRoute: RoutesManager.homeRoute,
      navigatorKey: Helpers.navigatorKey,
    );
  }
}
