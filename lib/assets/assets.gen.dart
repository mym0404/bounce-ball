/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBackgroundGen get background => const $AssetsImagesBackgroundGen();
  $AssetsImagesEffectGen get effect => const $AssetsImagesEffectGen();

  /// File path: assets/images/logo1024.png
  AssetGenImage get logo1024 => const AssetGenImage('assets/images/logo1024.png');

  $AssetsImagesPlanetGen get planet => const $AssetsImagesPlanetGen();

  /// File path: assets/images/tile.png
  AssetGenImage get tile => const AssetGenImage('assets/images/tile.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo1024, tile];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/clear.json
  LottieGenImage get clear => const LottieGenImage('assets/lottie/clear.json');

  /// List of all assets
  List<LottieGenImage> get values => [clear];
}

class $AssetsTilesGen {
  const $AssetsTilesGen();

  /// File path: assets/tiles/Tiles.tsx
  String get tiles => 'assets/tiles/Tiles.tsx';

  /// File path: assets/tiles/lv1_1.tmx
  String get lv01 => 'assets/tiles/lv1_1.tmx';

  /// File path: assets/tiles/lv1_2.tmx
  String get lv02 => 'assets/tiles/lv1_2.tmx';

  /// File path: assets/tiles/lv1_3.tmx
  String get lv03 => 'assets/tiles/lv1_3.tmx';

  /// File path: assets/tiles/lv-04.tmx
  String get lv04 => 'assets/tiles/lv-04.tmx';

  /// File path: assets/tiles/lv-05.tmx
  String get lv05 => 'assets/tiles/lv-05.tmx';

  /// File path: assets/tiles/lv-06.tmx
  String get lv06 => 'assets/tiles/lv-06.tmx';

  /// File path: assets/tiles/lv-07.tmx
  String get lv07 => 'assets/tiles/lv-07.tmx';

  /// File path: assets/tiles/lv-08.tmx
  String get lv08 => 'assets/tiles/lv-08.tmx';

  /// File path: assets/tiles/lv-09.tmx
  String get lv09 => 'assets/tiles/lv-09.tmx';

  /// File path: assets/tiles/lv-16.tmx
  String get lv16 => 'assets/tiles/lv-16.tmx';

  /// File path: assets/tiles/tile.tiled-project
  String get tileTiledProject => 'assets/tiles/tile.tiled-project';

  /// File path: assets/tiles/tile.tiled-session
  String get tileTiledSession => 'assets/tiles/tile.tiled-session';

  /// List of all assets
  List<String> get values =>
      [tiles, lv01, lv02, lv03, lv04, lv05, lv06, lv07, lv08, lv09, lv16, tileTiledProject, tileTiledSession];
}

class $AssetsImagesBackgroundGen {
  const $AssetsImagesBackgroundGen();

  /// File path: assets/images/background/blue.png
  AssetGenImage get blue => const AssetGenImage('assets/images/background/blue.png');

  /// File path: assets/images/background/green.png
  AssetGenImage get green => const AssetGenImage('assets/images/background/green.png');

  /// File path: assets/images/background/purple.png
  AssetGenImage get purple => const AssetGenImage('assets/images/background/purple.png');

  /// File path: assets/images/background/star1.png
  AssetGenImage get star1 => const AssetGenImage('assets/images/background/star1.png');

  /// File path: assets/images/background/star2.png
  AssetGenImage get star2 => const AssetGenImage('assets/images/background/star2.png');

  /// File path: assets/images/background/star3.png
  AssetGenImage get star3 => const AssetGenImage('assets/images/background/star3.png');

  /// List of all assets
  List<AssetGenImage> get values => [blue, green, purple, star1, star2, star3];
}

class $AssetsImagesEffectGen {
  const $AssetsImagesEffectGen();

  $AssetsImagesEffectSmokeGen get smoke => const $AssetsImagesEffectSmokeGen();
}

class $AssetsImagesPlanetGen {
  const $AssetsImagesPlanetGen();

  /// File path: assets/images/planet/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/images/planet/empty.png');

  /// File path: assets/images/planet/loading.png
  AssetGenImage get loading => const AssetGenImage('assets/images/planet/loading.png');

  /// File path: assets/images/planet/world1.png
  AssetGenImage get world1 => const AssetGenImage('assets/images/planet/world1.png');

  /// File path: assets/images/planet/world2.png
  AssetGenImage get world2 => const AssetGenImage('assets/images/planet/world2.png');

  /// List of all assets
  List<AssetGenImage> get values => [empty, loading, world1, world2];
}

class $AssetsImagesEffectSmokeGen {
  const $AssetsImagesEffectSmokeGen();

  /// File path: assets/images/effect/smoke/smoke1.png
  AssetGenImage get smoke1 => const AssetGenImage('assets/images/effect/smoke/smoke1.png');

  /// File path: assets/images/effect/smoke/smoke2.png
  AssetGenImage get smoke2 => const AssetGenImage('assets/images/effect/smoke/smoke2.png');

  /// File path: assets/images/effect/smoke/smoke3.png
  AssetGenImage get smoke3 => const AssetGenImage('assets/images/effect/smoke/smoke3.png');

  /// File path: assets/images/effect/smoke/smoke4.png
  AssetGenImage get smoke4 => const AssetGenImage('assets/images/effect/smoke/smoke4.png');

  /// List of all assets
  List<AssetGenImage> get values => [smoke1, smoke2, smoke3, smoke4];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsTilesGen tiles = $AssetsTilesGen();
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

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
