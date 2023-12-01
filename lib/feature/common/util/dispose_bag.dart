import '../../../export.dart' show Component, Stream, StreamSubscription, VAL, VC;

mixin DisposeBag on Component {
  final List<StreamSubscription<dynamic>> _subscriptions = [];
  final List<VC> _unsubscribesForValue = [];

  void listenStream<T>(Stream<T> stream, void Function(T) listener) {
    var subscription = stream.listen((event) {
      listener(event);
    });
    _subscriptions.add(subscription);
  }

  VC listenValue<T>(
    VAL<T> value,
    void Function(T value) listener, {
    bool listenInitialValue = true,
  }) {
    var listenerInstance = () {
      listener(value.value);
    };

    value.addListener(listenerInstance);
    var unsubscribe = () {
      value.removeListener(listenerInstance);
    };
    _unsubscribesForValue.add(unsubscribe);

    if (listenInitialValue) {
      listener(value.value);
    }

    return unsubscribe;
  }

  @override
  void onRemove() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    for (var unsubscribe in _unsubscribesForValue) {
      unsubscribe();
    }
    super.onRemove();
  }
}
