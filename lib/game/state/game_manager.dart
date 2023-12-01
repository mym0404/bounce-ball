import '../../export.dart';
import '../component/level/Level.dart';

class GameManager {
  VAL<Level> level = VAL(Level.lv01);
  VAL<int> deathCount = VAL(0);
}
