import '../../../export.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder({
    super.key,
    required this.wrapper,
    required this.condition,
    required this.child,
  });

  final Widget child;
  final Widget Function(BuildContext context, Widget child) wrapper;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper(context, child) : child;
  }
}
