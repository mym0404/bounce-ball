import 'package:flame/parallax.dart';

import '../../../export.dart';

class LevelBackground extends PositionComponent with GRef {
  LevelBackground() : super(size: V2(Const.worldWidth, Const.worldHeight));

  @override
  FutureOr<void> onLoad() async {
    var bg = await game.loadParallaxComponent(
      [
        ParallaxImageData(Assets.images.background.star3.gPath),
      ],
      baseVelocity: V2(10, 5),
      velocityMultiplierDelta: V2(1.8, 1.0),
      alignment: Alignment.topLeft,
    );

    add(bg);
  }
}
