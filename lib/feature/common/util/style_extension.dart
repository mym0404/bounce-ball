import '../../../export.dart';

extension BorderRadiusExtension on num {
  Radius get radius => Radius.circular(toDouble());
  BorderRadius get bRadius => BorderRadius.circular(toDouble());
}

extension BorderR2Extension on (Color, num) {
  Border get border => Border.all(color: $1, width: $2.toDouble());
}
