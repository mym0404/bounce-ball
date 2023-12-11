import '../../../export.dart';
import '../../../feature/common/widget/interval_builder.dart';
import '../../state/game_manager.dart';

class GameStatusPanel extends StatelessWidget with WatchItMixin {
  const GameStatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var level = watchValue((GameManager e) => e.level);
    var scoreOfStage = watchValue((GameManager e) => e.scoreOfStage);
    var isGameStarted = watchValue((GameManager e) => e.isGameStarted);
    var isStageCleared = watchValue((GameManager e) => e.isStageCleared);

    return DefaultTextStyle(
      style: TS.b1.onSurface.copyWith(
        shadows: [
          const Shadow(color: C.primary, blurRadius: 2, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'BOUNCE    BALL  (0.5.0)',
            style: TS.t3.bold,
          ),
          if (isGameStarted) Text('${level.world.name} - ${level.name}'),
          if (isGameStarted) ...[
            Text(
              'DIE ${scoreOfStage.deathCount}   BOUNCE ${scoreOfStage.bounceCount}',
            ),
            RepaintBoundary(
              child: IntervalBuilder(
                interval: 0.01.seconds,
                builder: (context) {
                  var diffMs = isStageCleared
                      ? scoreOfStage.timeMs
                      : scoreOfStage.startUnixMs == 0
                          ? 0
                          : unixMs - scoreOfStage.startUnixMs;
                  var formatted = (diffMs / 1000).toStringAsFixed(3);
                  return Text(formatted);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
