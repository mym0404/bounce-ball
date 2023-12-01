import 'package:flame/effects.dart';
import 'package:flame/sprite.dart';

import '../../../export.dart';

sealed class VfxEffect extends SpriteAnimationComponent with GRef {
  VfxEffect({
    required this.imageName,
    this.stepTime = 0.2,
    required this.start,
    required this.end,
    this.row = 1,
  });

  String imageName;
  double stepTime;
  int start, end, row;

  int get length => end - start + 1;

  @override
  FutureOr<void> onLoad() {
    priority = 5;
    size = V2.all(32);
    var image = game.images.fromCache(imageName);
    var sheet = SpriteSheet(image: image, srcSize: V2.all(64));
    animation = sheet.createAnimation(row: row, stepTime: stepTime, from: start, to: end);

    add(RemoveEffect(delay: length * stepTime));
  }
}

class GroundJumpVfxEffect extends VfxEffect {
  GroundJumpVfxEffect()
      : super(imageName: 'effect/smoke/smoke3.png', start: 0, end: 7, row: 12, stepTime: 0.05);
}
