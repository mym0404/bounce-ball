import '../../export.dart';

extension AssetGenExtension on AssetGenImage {
  String get gPath => path.replaceFirst('assets/images/', '');
}

extension AssetStringExtension on String {
  String get audioPath => replaceFirst('assets/audio/', '');
}

const $AssetsImagesGen img = Assets.images;
const $AssetsAudioGen sfxs = Assets.audio;
