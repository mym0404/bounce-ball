import '../../export.dart';
import '../../feature/common/widget/app_dialog.dart';
import '../../service/router/app_router.dart';
import '../component/level/Level.dart';
import '../main_game.dart';
import '../ui/dialog/game_all_clear_dialog.dart';
import '../ui/dialog/game_ready_dialog.dart';
import 'level_clear_storage.dart';

class GameManager {
  VAL<bool> isGameStarted = VAL(false);
  VAL<Level> level = VAL(Level.lv00);
  VAL<int> deathCount = VAL(0);

  MainGame get game => di();

  void startGame() {
    isGameStarted.value = true;
    level.value = Level.lv01;
  }

  void clearLevel() {
    di<LevelClearStorage>().markClear(level.value);
    fbAnalytics.logLevelEnd(levelName: level.value.name);
    var index = Level.values.indexOf(level.value);
    if (index == Level.values.length - 1) {
      _allClear();
    } else {
      level.value = Level.values[index + 1];
    }
  }

  void _allClear() {
    showAppDialog(globalContext, (context) => const GameAllClearDialog(), dismissible: false);
    isGameStarted.value = false;
  }

  void resetGame() {
    isGameStarted.value = false;
    level.value = Level.values.first;
    deathCount.value = 0;
    showAppDialog(globalContext, (context) => const GameReadyDialog(), dismissible: false);
  }

  void die() {
    deathCount.value += 1;
    fbAnalytics.logEvent(name: 'level_die', parameters: {'level': level.value.name});
  }

  void resetLevel() {
    game.ball.reset();
  }

  void moveLevel(Level level) {
    this.level.value = level;
    deathCount.value = 0;
  }
}
