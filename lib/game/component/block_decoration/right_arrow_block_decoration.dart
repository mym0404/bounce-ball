import '../../../export.dart';

class RightArrowBlockDecoration extends CustomPainterComponent {
  @override
  FutureOr<void> onLoad() {
    size = V2.all(16);
    painter = _Painter();

    anchor = Anchor.center;
    position = V2(8, 8);
    // add(SizeEffect.by(V2(6, 6), InfiniteEffectController(EffectController(duration: 4, reverseDuration: 4))));
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    assert(w == size.height);

    var path = Path()
      ..moveTo(1, w / 3)
      ..lineTo(w / 2, w / 3)
      ..lineTo(w / 2, 0)
      ..lineTo(w - 1, w / 2)
      ..lineTo(w / 2, w)
      ..lineTo(w / 2, w * 2 / 3)
      ..lineTo(1, w * 2 / 3)
      ..close();

    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTRB(0, 0, w, w), 4.radius),
      Paint()
        ..color = Colors.white70
        ..style = PaintingStyle.stroke,
    );

    canvas.drawPath(path, Paint()..color = Colors.green[200]!);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
