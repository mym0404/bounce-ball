/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBackgroundGen get background =>
      const $AssetsImagesBackgroundGen();
  $AssetsImagesEffectGen get effect => const $AssetsImagesEffectGen();
}

class $AssetsImagesBackgroundGen {
  const $AssetsImagesBackgroundGen();

  /// File path: assets/images/background/blue.png
  AssetGenImage get blue =>
      const AssetGenImage('assets/images/background/blue.png');

  /// File path: assets/images/background/green.png
  AssetGenImage get green =>
      const AssetGenImage('assets/images/background/green.png');

  /// File path: assets/images/background/purple.png
  AssetGenImage get purple =>
      const AssetGenImage('assets/images/background/purple.png');

  /// File path: assets/images/background/star1.png
  AssetGenImage get star1 =>
      const AssetGenImage('assets/images/background/star1.png');

  /// File path: assets/images/background/star2.png
  AssetGenImage get star2 =>
      const AssetGenImage('assets/images/background/star2.png');

  /// File path: assets/images/background/star3.png
  AssetGenImage get star3 =>
      const AssetGenImage('assets/images/background/star3.png');

  /// List of all assets
  List<AssetGenImage> get values => [blue, green, purple, star1, star2, star3];
}

class $AssetsImagesEffectGen {
  const $AssetsImagesEffectGen();

  $AssetsImagesEffectBullet16Gen get bullet16 =>
      const $AssetsImagesEffectBullet16Gen();
}

class $AssetsImagesEffectBullet16Gen {
  const $AssetsImagesEffectBullet16Gen();

  /// File path: assets/images/effect/bullet16/green16x16.png
  AssetGenImage get green16x16 =>
      const AssetGenImage('assets/images/effect/bullet16/green16x16.png');

  /// File path: assets/images/effect/bullet16/ice16x16.png
  AssetGenImage get ice16x16 =>
      const AssetGenImage('assets/images/effect/bullet16/ice16x16.png');

  /// File path: assets/images/effect/bullet16/purple16x16.png
  AssetGenImage get purple16x16 =>
      const AssetGenImage('assets/images/effect/bullet16/purple16x16.png');

  /// File path: assets/images/effect/bullet16/red16x16.png
  AssetGenImage get red16x16 =>
      const AssetGenImage('assets/images/effect/bullet16/red16x16.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [green16x16, ice16x16, purple16x16, red16x16];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
