import '../../export.dart';
import '../component/level/Level.dart';
import '../main_game.dart';
import '../overlay/overlay_id.dart';

class GameManager {
  VAL<bool> isGameStarted = VAL(false);
  VAL<Level> level = VAL(Level.values.first);
  VAL<int> deathCount = VAL(0);

  void startGame() {
    isGameStarted.value = true;
    di<MainGame>().overlays.clear();
  }

  void clearLevel() {
    var index = Level.values.indexOf(level.value);
    if (index == Level.values.length - 1) {
      _allClear();
    } else {
      level.value = Level.values[index + 1];
    }
  }

  void _allClear() {
    di<MainGame>().overlays.add(OverlayId.allClear);
    isGameStarted.value = false;
  }

  void resetGame() {
    isGameStarted.value = false;
    level.value = Level.values.first;
    deathCount.value = 0;
    di<MainGame>().overlays.clear();
    di<MainGame>().overlays.add(OverlayId.ready);
  }

  void die() {
    deathCount.value += 1;
  }
}
