import '../../../export.dart';

extension DurationDelay on Duration {
  Future<T> runAfter<T>(FutureOr<T> Function() callback) => Future.delayed(this, callback);
}
