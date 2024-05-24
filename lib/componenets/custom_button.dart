import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../core/device/sizes/sizes.dart';
import '../utils/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final String? textFamily;
  final String? iconPath;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final bool hasSuffixIcon;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double height;
  final double? width;
  final void Function()? onPressed;
  final bool isLoading;
  const CustomButton({
    required this.text,
    required this.textColor,
    this.textSize = 16,
    this.textFamily,
    this.iconPath,
    this.iconColor,
    this.iconWidth = 16,
    this.iconHeight = 16,
    this.width,
    this.hasSuffixIcon = false,
    required this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8,
    this.height = 48,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? Sizes.screenWidth(context),
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled) || isLoading) {
                return backgroundColor.withOpacity(0.8);
              }
              return backgroundColor;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const Center(
                child: SpinKitThreeBounce(
                  color: ColorConstants.white,
                  size: 20.0,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontFamily: textFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(8),
                  (hasSuffixIcon)
                      ? SvgPicture.asset(
                          iconPath.toString(),
                          width: iconWidth,
                          height: iconHeight,
                          colorFilter: ColorFilter.mode(
                            iconColor ?? ColorConstants.textHeader,
                            BlendMode.srcIn,
                          ),
                        )
                      : const Gap(0),
                ],
              ),
      ),
    );
  }
}
