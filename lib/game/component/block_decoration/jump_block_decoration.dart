import 'package:flame/effects.dart';

import '../../../export.dart';

class JumpBlockDecoration extends CustomPainterComponent {
  @override
  FutureOr<void> onLoad() {
    size = V2.all(16);
    painter = _Painter();

    anchor = Anchor.center;
    position = V2(8, 8);
    add(SizeEffect.by(V2(6, 6), InfiniteEffectController(EffectController(duration: 4, reverseDuration: 4))));
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    assert(w == size.height);

    var paint = Paint()
      ..color = Colors.blueAccent[100]!
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    canvas.drawCircle(Offset(w / 2, w / 2), w / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
