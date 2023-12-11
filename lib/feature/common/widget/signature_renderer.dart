import 'package:signature/signature.dart';

import '../../../export.dart' hide Point;

class SignatureRenderer extends StatefulWidget {
  const SignatureRenderer({
    super.key,
    required this.points,
    required this.size,
  });

  final List<Point> points;
  final double size;

  @override
  State<SignatureRenderer> createState() => _SignatureRendererState();
}

class _SignatureRendererState extends State<SignatureRenderer> {
  late final SignatureController _controller =
      SignatureController(points: normalizedPoints, disabled: true, penColor: C.white);

  late final normalizedRatio =
      (widget.size - 10) / (widget.points.map((e) => max(e.offset.dx, e.offset.dy)).maxOrNull ?? 1);
  late final normalizedPoints = widget.points
      .map((e) => Point(e.offset.scale(normalizedRatio, normalizedRatio), e.type, e.pressure))
      .toList();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: (C.onSurface30, 1).border),
      child: Signature(
        controller: _controller,
        backgroundColor: C.surface,
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
