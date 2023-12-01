import '../../../export.dart';

class CollisionBlock extends PositionComponent {
  CollisionBlock({
    super.position,
    super.size,
  }) {
    debugMode = true;
  }
}
