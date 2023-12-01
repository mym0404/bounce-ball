import '../../../export.dart';

class OverlayPanel extends StatelessWidget {
  const OverlayPanel({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: 12.bRadius,
        border: Border.all(color: C.onSurface),
        boxShadow: [
          const BoxShadow(color: Colors.white38, blurRadius: 20, blurStyle: BlurStyle.outer),
          BoxShadow(color: C.primary50, blurRadius: 12, blurStyle: BlurStyle.outer),
        ],
        color: C.surface.withOpacity(0.5),
      ),
      child: child,
    );
  }
}
