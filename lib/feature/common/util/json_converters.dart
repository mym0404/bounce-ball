import '../../../export.dart';

class Vector2JsonConverter extends JsonConverter<V2, String> {
  const Vector2JsonConverter();
  @override
  V2 fromJson(String json) {
    var tmp = json.split(',');
    return V2(double.parse(tmp[0]), double.parse(tmp[1]));
  }

  @override
  String toJson(V2 object) {
    return '${object.x},${object.y}';
  }
}
