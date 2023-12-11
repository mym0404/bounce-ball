import '../../../export.dart';

extension DateTimeFormat on DateTime {
  String format(String pattern) {
    return DateFormat(pattern).format(toLocal());
  }

  String get iso => toUtc().toIso8601String();
}
