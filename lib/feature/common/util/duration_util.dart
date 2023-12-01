import '../../../export.dart';

extension IntDuration on int {
  Duration get ms => Duration(milliseconds: this);
}

extension DurationDelay on Duration {
  Future<T> runAfter<T>(FutureOr<T> Function() callback) => Future.delayed(this, callback);
}
