import '../../../export.dart';

class CollisionBlock extends PositionComponent {
  CollisionBlock({
    super.position,
    super.size,
  }) {
    debugMode = true;
  }

  CollisionBlock.fromObject(TiledObject obj)
      : this(size: V2(obj.width, obj.height), position: V2(obj.x, obj.y));
}
