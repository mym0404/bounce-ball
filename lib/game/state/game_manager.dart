import '../../export.dart';
import '../../feature/common/widget/app_dialog.dart';
import '../../service/router/app_router.dart';
import '../component/level/Level.dart';
import '../main_game.dart';
import '../overlay/game_all_clear_overlay.dart';
import '../overlay/game_ready_overlay.dart';

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
    fbAnalytics.logLevelEnd(levelName: level.value.name);
    var index = Level.values.indexOf(level.value);
    if (index == Level.values.length - 1) {
      _allClear();
    } else {
      level.value = Level.values[index + 1];
    }
  }

  void _allClear() {
    showAppDialog(globalContext, (context) => const GameAllClearOverlay(), dismissible: false);
    isGameStarted.value = false;
  }

  void resetGame() {
    isGameStarted.value = false;
    level.value = Level.values.first;
    deathCount.value = 0;
    showAppDialog(globalContext, (context) => const GameReadyOverlay(), dismissible: false);
  }

  void die() {
    deathCount.value += 1;
    fbAnalytics.logEvent(name: 'level_die', parameters: {'level': level.value.name});
  }

  void resetLevel() {
    game.ball.reset();
  }
}
