import 'package:flutter/material.dart';
import 'package:scelloo_test/injection_container.dart';
import 'package:toastification/toastification.dart';

import '../constants/color_constants.dart';

class Helpers {
  //UI helper functions------------------------------------------------------------------------------------------------
  static void showToast(BuildContext context, String status, String message) {
    final statusToToastType = {
      'success': ToastificationType.success,
      'error': ToastificationType.error,
      'info': ToastificationType.info,
      'warning': ToastificationType.warning,
    };

    final statusToIcon = {
      'success': const Icon(
        Icons.check_circle_outline,
        color: ColorConstants.successBorder,
      ),
      'error': const Icon(
        Icons.error_outline,
        color: ColorConstants.errorBorder,
      ),
      'info': const Icon(
        Icons.info_outline,
        color: ColorConstants.infoBorder,
      ),
      'warning': const Icon(
        Icons.warning_amber_outlined,
        color: ColorConstants.warningBorder,
      ),
    };

    final toastType = statusToToastType[status];
    final icon = statusToIcon[status];
    if (toastType != null) {
      toastification.show(
          context: context,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          type: toastType,
          style: ToastificationStyle.flatColored,
          title: Text(
            message,
            style: const TextStyle(
              color: ColorConstants.black,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 3),
          showProgressBar: false,
          dragToClose: true,
          icon: icon);
    }
  }

  //Unfocus ------------------------------------------------------------------------------------------------------------
  static void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  //CloseKeyboard ------------------------------------------------------------------------------------------------------
  static void closeKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasPrimaryFocus ||
        FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

//Navigator helper functions ---------------------------------------------------------------------------------------
  static final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  static navigateToPage(String routeName, {Object? arguments}) {
    debugPrint(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static void popPage() {
    navigatorKey.currentState!.pop();
  }

  static navigateToPageAndReplace(String routeName, {Object? arguments}) {
    debugPrint(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static navigateToPageAndRemoveUntil(String routeName, {Object? arguments}) {
    debugPrint(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

//isDarkMode ---------------------------------------------------------------------------------------------------------
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

//Shift focus functions --------------------------------------------------------------------------------------------
  static void shiftFocus(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (nextFocus != null) {
      currentFocus?.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    } else {
      currentFocus?.unfocus();
    }
  }
}
