import 'package:local_file_preferences/local_file_preferences.dart';

import '../../export.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

@freezed
class UserPreferencesData with _$UserPreferencesData {
  const UserPreferencesData._();
  const factory UserPreferencesData({
    @Default(true) bool isShowArrowControls,
    @Default(1) double cameraZoomScale,
  }) = _UserPreferencesData;

  factory UserPreferencesData.fromJson(Map<String, dynamic> json) => _$UserPreferencesDataFromJson(json);
}

class UserPreferences with LocalFilePrefMixin<UserPreferencesData> {
  @override
  UserPreferencesData get fallback => const UserPreferencesData();

  @override
  String get fileName => 'user_pref.dat';

  @override
  UserPreferencesData fromJson(Map<String, dynamic> json) => UserPreferencesData.fromJson(json);

  @override
  Map<String, dynamic> toJson() => value.toJson();
}
