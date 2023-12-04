import '../../export.dart';

extension AssetGenExtension on AssetGenImage {
  String get gPath => path.replaceFirst('assets/images/', '');
}

$AssetsImagesGen get img => Assets.images;
