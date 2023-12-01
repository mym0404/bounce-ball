import '../../../export.dart';

class SimpleStreamBuilder<T> extends StatelessWidget {
  const SimpleStreamBuilder(
    this.stream, {
    required this.builder,
    super.key,
  });

  final Stream<T> stream;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return builder(context, snapshot.requireData);
      },
    );
  }
}
