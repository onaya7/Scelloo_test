/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Sora-Bold.ttf
  String get soraBold => 'assets/fonts/Sora-Bold.ttf';

  /// File path: assets/fonts/Sora-ExtraBold.ttf
  String get soraExtraBold => 'assets/fonts/Sora-ExtraBold.ttf';

  /// File path: assets/fonts/Sora-ExtraLight.ttf
  String get soraExtraLight => 'assets/fonts/Sora-ExtraLight.ttf';

  /// File path: assets/fonts/Sora-Light.ttf
  String get soraLight => 'assets/fonts/Sora-Light.ttf';

  /// File path: assets/fonts/Sora-Medium.ttf
  String get soraMedium => 'assets/fonts/Sora-Medium.ttf';

  /// File path: assets/fonts/Sora-Regular.ttf
  String get soraRegular => 'assets/fonts/Sora-Regular.ttf';

  /// File path: assets/fonts/Sora-SemiBold.ttf
  String get soraSemiBold => 'assets/fonts/Sora-SemiBold.ttf';

  /// File path: assets/fonts/Sora-Thin.ttf
  String get soraThin => 'assets/fonts/Sora-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        soraBold,
        soraExtraBold,
        soraExtraLight,
        soraLight,
        soraMedium,
        soraRegular,
        soraSemiBold,
        soraThin
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/warning.svg
  SvgGenImage get warning => const SvgGenImage('assets/icons/warning.svg');

  /// File path: assets/icons/x-close-border.svg
  SvgGenImage get xCloseBorder =>
      const SvgGenImage('assets/icons/x-close-border.svg');

  /// List of all assets
  List<SvgGenImage> get values => [warning, xCloseBorder];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
