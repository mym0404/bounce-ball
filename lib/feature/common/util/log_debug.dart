import '../../../export.dart';

class Logger {
  void i(
    dynamic o1, [
    dynamic o2 = 42,
    dynamic o3 = 42,
    dynamic o4 = 42,
    dynamic o5 = 42,
    dynamic o6 = 42,
  ]) {
    String ret = '🔅$o1 ';
    if (o2 != 42) ret += ', $o2';
    if (o3 != 42) ret += ', $o3';
    if (o4 != 42) ret += ', $o4';
    if (o5 != 42) ret += ', $o5';
    if (o6 != 42) ret += ', $o6';
    if (kDebugMode) {
      print(ret);
    }
  }

  void e(dynamic o1, [dynamic o2 = 42]) {
    String ret = '🔥 $o1\n${o1 is Error ? o1.stackTrace : ''}';
    if (o2 != 42) {
      ret += '\n🔥 $o2\n${o2 is Error ? o2.stackTrace : ''}';
    }
    if (kDebugMode) {
      debugPrint(ret);
    }
  }
}
