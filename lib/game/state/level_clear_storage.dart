import 'package:local_file_preferences/local_file_preferences.dart';

import '../../export.dart';
import '../component/level/Level.dart';

class LevelClearStorage with LocalFilePrefMixin<List<String>> {
  @override
  List<String> get fallback => const [];

  @override
  String get fileName => 'clear.dat';

  @override
  List<String> fromJson(Map<String, dynamic> json) {
    return (json['data'] as List<dynamic>).cast<String>();
  }

  @override
  Map<String, dynamic> toJson() {
    return {'data': value};
  }

  void markClear(Level level) {
    var newValue = [...value, level.id];
    value = newValue.toSet().toList().sorted();
  }

  bool isCleared(Level level) {
    return value.contains(level.id);
  }
}
