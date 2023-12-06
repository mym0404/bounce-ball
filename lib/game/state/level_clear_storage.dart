import 'package:encrypt/encrypt.dart';
import 'package:local_file_preferences/local_file_preferences.dart';

import '../../export.dart' hide Key;
import '../component/level/Level.dart';

class LevelClearStorage with LocalFilePrefMixin<List<String>> {
  final encrypter = Encrypter(AES(Key.fromBase64('tf26lu3BFyEx/3gL+Y5GVreXhYF9uxnjhQZLLqTFDYg=')));
  final iv = IV.allZerosOfLength(16);

  @override
  List<String> get fallback => const [];

  @override
  String get fileName => 'clear.dat';

  @override
  List<String> fromJson(Map<String, dynamic> json) {
    var raw = json['data'] as String;
    var decrpyted = encrypter.decrypt(Encrypted.fromBase64(raw), iv: iv);
    var decoded = jsonDecode(decrpyted);
    return (decoded as List<dynamic>).cast<String>();
  }

  @override
  Map<String, dynamic> toJson() {
    return {'data': encrypter.encrypt(jsonEncode(value), iv: iv).base64};
  }

  void markClear(Level level) {
    var newValue = [...value, level.id];
    value = newValue.toSet().toList().sorted();
  }

  bool isCleared(Level level) {
    return value.contains(level.id);
  }
}
