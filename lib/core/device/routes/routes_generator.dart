import 'package:flutter/material.dart';
import 'package:scelloo_test/features/home/presentation/pages/post_view.dart';
import 'package:scelloo_test/features/home/presentation/pages/postcreate_view.dart';

import '../../../features/home/presentation/pages/postdetail_view.dart';
import '../../../features/home/presentation/pages/postedit_view.dart';
import 'routes_manager.dart';
import 'undefined_route.dart';

class RoutesGenerator {
  RoutesGenerator._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Home  ------------------------------------------------------------------------------------------------------------
      case RoutesManager.postRoute:
        return MaterialPageRoute(builder: (context) => const PostView());
      case RoutesManager.postDetailRoute:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;
          return PostDetailView(args: args);
        });

      case RoutesManager.postCreateRoute:
        return MaterialPageRoute(builder: (context) => const PostCreateView());
      case RoutesManager.postEditRoute:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;
          return PostEditView(args: args);
        });

      //Default
      default:
        return MaterialPageRoute(builder: (context) => const UndefinedRoute());
    }
  }
}
