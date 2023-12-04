import 'package:flutter_animate/flutter_animate.dart';

import '../../../export.dart';
import '../../../service/layout/layout_manager.dart';

class OverlayPanel extends StatelessWidget with WatchItMixin {
  const OverlayPanel({
    super.key,
    required this.child,
    this.size = PanelSize.m,
  });

  final Widget child;
  final PanelSize size;

  @override
  Widget build(BuildContext context) {
    var screenWidth = watchPropertyValue((LayoutManager e) => e.size.width);
    var maxWidth = screenWidth * 0.9;
    var minWidth = min(maxWidth, size.minWidth);

    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(minWidth: minWidth),
      decoration: BoxDecoration(
        borderRadius: 4.bRadius,
        border: Border.all(color: C.onSurface),
        boxShadow: const [
          BoxShadow(color: Colors.white38, blurRadius: 20, blurStyle: BlurStyle.outer),
          BoxShadow(color: Colors.white, blurRadius: 12, blurStyle: BlurStyle.outer),
        ],
        color: C.surface.withOpacity(0.5),
      ),
      child: child,
    ).animate().fadeIn(duration: 700.ms).slide(begin: const Offset(0, 0.02), end: Offset.zero);
  }
}

enum PanelSize {
  s(200),
  m(300),
  l(400);

  const PanelSize(this.minWidth);
  final double minWidth;
}
