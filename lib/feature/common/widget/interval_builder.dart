import 'dart:async' show Timer;

import '../../../export.dart' hide Timer;

class IntervalBuilder extends StatefulWidget {
  const IntervalBuilder({
    super.key,
    this.builder,
    this.interval = const Duration(milliseconds: 1000),
  });

  final WidgetBuilder? builder;
  final Duration interval;

  @override
  State<IntervalBuilder> createState() => _IntervalBuilderState();
}

class _IntervalBuilderState extends State<IntervalBuilder> {
  late final Timer _timer;
  var v = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.interval, (timer) {
      setState(() {
        v = timer.tick;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(context) ?? const Empty();
  }
}
