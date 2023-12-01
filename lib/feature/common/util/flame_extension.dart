import '../../../export.dart';

extension PositionComponentExtension on PositionComponent {
  // need caution
  PositionComponent get par => parent as PositionComponent;
}

extension IntVector on int {
  Vector2 get v2 => toDouble().v2;
}

extension DoubleVector on double {
  Vector2 get v2 => V2.all(this);
}
