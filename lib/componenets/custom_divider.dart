import 'package:flutter/material.dart';

import '../utils/constants/color_constants.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double? thickness;
  final Color? color;
  const CustomDivider(
      {required this.height, this.thickness, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness ?? 1,
      color: color ?? ColorConstants.grey200,
    );
  }
}