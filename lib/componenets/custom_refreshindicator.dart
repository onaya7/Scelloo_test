import 'package:flutter/material.dart';

import '../utils/constants/color_constants.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      displacement: 30.0,
      backgroundColor: ColorConstants.white,
      color: ColorConstants.primary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}