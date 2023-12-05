import '../../export.dart';

extension AssetGenExtension on AssetGenImage {
  String get gPath => path.replaceFirst('assets/images/', '');
}

const $AssetsImagesGen img = Assets.images;
