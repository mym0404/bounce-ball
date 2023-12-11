import 'package:signature/signature.dart';

import '../../../export.dart' hide Point;

class SignaturePointJsonConverter extends JsonConverter<Point, String> {
  const SignaturePointJsonConverter();
  @override
  Point fromJson(String json) {
    PointType type = PointType.values[int.parse(json.split('/')[0])];
    Offset offset = Offset(double.parse(json.split('/')[1]), double.parse(json.split('/')[2]));
    double pressure = double.parse(json.split('/')[3]);
    return Point(offset, type, pressure);
  }

  @override
  String toJson(Point object) {
    return '${object.type.index}/${object.offset.dx}/${object.offset.dy}/${object.pressure}';
  }
}
