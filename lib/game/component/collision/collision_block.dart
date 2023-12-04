import '../../../export.dart';
import '../ball/ball.dart';

class CollisionBlock extends PositionComponent with HasVisibility {
  CollisionBlock({
    super.position,
    super.size,
    this.tiledObject,
  });

  CollisionBlock.fromObject(TiledObject obj)
      : this(
          size: V2(obj.width, obj.height),
          position: V2(obj.x, obj.y),
          tiledObject: obj,
        );

  bool isActive = true;

  TiledObject? tiledObject;

  void inActivate() {
    isActive = false;
    isVisible = false;
  }

  void activate() {
    isActive = true;
    isVisible = true;
  }

  bool isOverlapWithBallNextPosition(V2 nextPosition) {
    if (!isActive) return false;
    return toRect().overlaps(Rect.fromCircle(center: nextPosition.toOffset(), radius: Ball.ballRadius));
  }
}
