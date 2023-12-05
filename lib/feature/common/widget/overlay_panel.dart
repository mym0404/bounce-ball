import 'package:flutter_animate/flutter_animate.dart';

import '../../../export.dart';
import '../../../service/layout/layout_manager.dart';

class OverlayPanel extends StatelessWidget with WatchItMixin {
  const OverlayPanel({
    super.key,
    required this.child,
    this.size = PanelSize.m,
    this.maxHeightRatio,
  });

  final Widget child;
  final PanelSize size;
  final double? maxHeightRatio;

  @override
  Widget build(BuildContext context) {
    var screenSize = watchPropertyValue((LayoutManager e) => e.size);
    var maxWidth = screenSize.width * 0.9;

    return NoSafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: min(maxWidth, size.minWidth),
        constraints:
            BoxConstraints(maxHeight: (maxHeightRatio ?? 0.9) * screenSize.height),
        decoration: BoxDecoration(
          borderRadius: 4.bRadius,
          border: Border.all(color: C.onSurface50, width: 1),
          boxShadow: const [
            BoxShadow(color: C.primary, blurRadius: 16),
          ],
          color: C.surface,
        ),
        child: child,
      ).animate().fadeIn(duration: 700.ms).slide(begin: const Offset(0, 0.02), end: Offset.zero),
    );
  }
}

enum PanelSize {
  s(200),
  m(300),
  l(400);

  const PanelSize(this.minWidth);
  final double minWidth;
}
