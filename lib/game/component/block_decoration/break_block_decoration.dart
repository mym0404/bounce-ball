import 'package:flame/rendering.dart';

import '../../../export.dart';

class BreakBlockDecoration extends SpriteComponent with GRef {
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(
      game.images.fromCache('tile.png'),
      srcSize: V2.all(16),
      srcPosition: V2(16 + 4 * 24, 16 + 16 * 24),
    );
    decorator.addLast(PaintDecorator.grayscale(opacity: 0.85));
  }
}
