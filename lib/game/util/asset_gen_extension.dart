import '../../export.dart';

extension AssetGenExtension on AssetGenImage {
  String get gPath => path.replaceFirst('assets/images/', '');
}
