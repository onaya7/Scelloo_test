import 'package:flutter/material.dart';

import '../utils/constants/color_constants.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final bool useFloatingActionButton;
  final VoidCallback? onFloatingActionButtonPressed;

  const CustomScaffold({
    super.key,
    this.backgroundColor,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
    this.useFloatingActionButton = false,
    this.onFloatingActionButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor ?? ColorConstants.grey200,
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: useFloatingActionButton
          ? SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70.0)),
                onPressed: onFloatingActionButtonPressed,
                backgroundColor: ColorConstants.primary,
                child: const Icon(
                  Icons.add,
                  color: ColorConstants.white,
                ),
              ),
            )
          : null,
    );
  }
}
