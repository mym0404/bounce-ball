import '../../export.dart';
import '../../feature/common/widget/app_dialog.dart';
import '../../feature/common/widget/overlay_panel.dart';
import '../../service/router/app_router.dart';
import '../component/level/Level.dart';
import '../main_game.dart';
import '../ui/dialog/game_all_clear_dialog.dart';
import '../ui/dialog/game_clear_score_dialog.dart';
import '../ui/dialog/game_ready_dialog.dart';
import 'level_clear_storage.dart';
import 'score_schema.dart';

class GameManager {
  VAL<bool> isGameLoading = VAL(true);
  VAL<bool> isGameStarted = VAL(false);
  VAL<bool> isStageCleared = VAL(false);
  VAL<Level> level = VAL(Level.lv00);
  VAL<ScoreSchema> scoreOfStage = VAL(ScoreSchema.initial());

  MainGame get game => di();

  void startGame() {
    isGameStarted.value = true;
    level.value = Level.lv01;
  }

  void clearLevel() {
    di<LevelClearStorage>().markClear(level.value);
    fbAnalytics.logLevelEnd(levelName: level.value.name);
    isStageCleared.value = true;
    scoreOfStage.value = scoreOfStage.value.copyWith(timeMs: unixMs - scoreOfStage.value.startUnixMs);
    showAppDialog(
      globalContext,
      (context) => GameClearScoreDialog(level: level.value, score: scoreOfStage.value),
      maxWidth: 600,
      size: PanelSize.l,
      dismissible: false,
    );
  }

  void moveToNextLevel() {
    var index = Level.values.indexOf(level.value);
    if (index == Level.values.length - 1) {
      _allClear();
      resetScore();
    } else {
      moveLevel(Level.values[index + 1]);
    }
  }

  void restartThisStage() {
    resetScore(resetDie: true);
    isStageCleared.value = false;
    game.loadLevel(level.value);
  }

  void _allClear() {
    showAppDialog(globalContext, (context) => const GameAllClearDialog(), dismissible: false);
    isGameStarted.value = false;
  }

  void resetGame() {
    isGameStarted.value = false;
    level.value = Level.values.first;
    resetScore(resetDie: true);
    showAppDialog(globalContext, (context) => const GameReadyDialog(), dismissible: false);
  }

  void die() {
    scoreOfStage.value = scoreOfStage.value.copyWith(deathCount: scoreOfStage.value.deathCount + 1);
    fbAnalytics.logEvent(name: 'level_die', parameters: {'level': level.value.name});
  }

  void resetLevel() {
    game.ball.reset();
  }

  void moveLevel(Level level) {
    this.level.value = level;
    resetScore(resetDie: true);
    isStageCleared.value = false;
  }

  void increaseBounceCount() {
    scoreOfStage.value = scoreOfStage.value.copyWith(bounceCount: scoreOfStage.value.bounceCount + 1);
    // start at first bounce
    if (scoreOfStage.value.bounceCount <= 1) {
      _markStageStart();
    }
  }

  void _markStageStart() {
    scoreOfStage.value = scoreOfStage.value.copyWith(startUnixMs: unixMs);
  }

  void resetScore({bool resetDie = true}) {
    scoreOfStage.value = ScoreSchema.initial(deathCount: resetDie ? 0 : scoreOfStage.value.deathCount);
    isStageCleared.value = false;
  }
}
